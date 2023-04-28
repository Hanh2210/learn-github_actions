<template>
  <textarea
    ref="textarea"
    class="app-textarea"
    :class="variantClass"
    :value="'Được dịch từ tiếng Anh-Trong xuất bản và thiết kế đồ họa, Lorem ipsum là một văn bản giữ chỗ thường được sử dụng để thể hiện hình thức trực quan của tài liệu hoặc kiểu chữ mà không dựa vào nội dung có ý nghĩa. Lorem ipsum có thể được sử dụng làm trình giữ chỗ trước khi có bản sao cuối cùng. Wikipedia (tiếng Anh)'"
    :style="autoResize"
    :placeholder="placeholder"
    @focus="scrollToBottom"
    @input="$emit('input', $event.target.value)"
  ></textarea>
</template>

<script>
export default {
  props: {
    value: {
      type: String,
      default: "",
    },
    placeholder: {
      type: String,
      default: "",
    },
    isAutoResize: {
      type: Boolean,
      default: false,
    },
    isShowTextarea: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      height: null,
    };
  },
  computed: {
    style() {
      return {
        height: this.height + "px",
      };
    },
    variantClass() {
      return this.isAutoResize ? "-auto-resize" : "";
    },
    autoResize() {
      return this.isAutoResize ? this.style : null;
    },
  },
  watch: {
    value() {
      this.$nextTick(() => {
        this.adjustHeight();
      });
    },
  },
  mounted() {
    this.adjustHeight();
    this.$nextTick(() => {
      const textarea = this.$refs.textarea;
      textarea.scrollTop = textarea.scrollHeight;
    });
  },
  updated() {
    this.$nextTick(function () {
      const textarea = this.$refs.textarea;
      const scrollHeight = textarea.scrollHeight;
      textarea.scrollTop = scrollHeight;
    });
  },
  methods: {
    adjustHeight() {
      this.height = this.$refs.textarea.scrollHeight;
    },
    scrollToBottom() {
      this.$nextTick(() => {
        const textarea = this.$refs.textarea;
        const scrollHeight = textarea.scrollHeight;
        textarea.scrollTop = scrollHeight;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.app-textarea {
  box-sizing: border-box;
  transition: height 0.2s;
  outline: none;
  border: 1px solid #ccc;
  padding: 8px;
  width: 200px;
  line-height: 1.5;
  font-size: 12px;
  &:focus {
    border-color: blue;
  }
}

.app-textarea.-auto-resize {
  min-height: 80px;
}
</style>
