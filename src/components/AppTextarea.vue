<template>
  <textarea
    ref="textarea"
    class="app-textarea"
    :class="variantClass"
    :style="autoResize"
    :placeholder="placeholder"
    @focus="scrollToBottom"
    @input="$emit('input', $event.target.value)"
  >
hanh hanh hanh hanh hanh hanh hanh hanh hanh hanh 
hanh hanh hanh hanh hanh hanh hanh hanh hanh hanh</textarea
  >
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
