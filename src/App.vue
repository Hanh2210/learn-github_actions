<script setup lang="ts">
import TheHeader from "./components/TheHeader.vue";
import AppTextarea from "./components/AppTextarea.vue";
import { computed } from "vue";
</script>

<template>
  <v-app>
    <v-main>
      <TheHeader />
      <AppTextarea />
    </v-main>
  </v-app>
</template>

<style scoped></style>
