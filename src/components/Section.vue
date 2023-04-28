<template>
  <div>
    <button class="button" @click="showTextarea">submit</button>
    <div v-if="isVisible" class="wrap">
      <AppTextarea class="textarea" :placeholder="'メモを入力'" :rows="6" />
    </div>
  </div>
</template>

<script>
import AppTextarea from "./AppTextarea.vue";
export default {
  components: { AppTextarea },
  data() {
    return {
      isVisible: false,
    };
  },

  methods: {
    showTextarea() {
      this.isVisible = !this.isVisible;
    },
  },
};
</script>

<style lang="scss" scoped>
.button {
  width: 60px;
  height: 30px;
  background-color: violet;
  color: #000;
}

.wrap {
  width: 500px;
  height: 300px;
}
</style>
