uint64_t sub_100003C38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100003CFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id objc_msgSend_sharedMediaLibraryService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedMediaLibraryService");
}

id objc_msgSend_updateSpotlightIndexForBundleID_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSpotlightIndexForBundleID:withCompletion:");
}

id objc_msgSend_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSpotlightIndexMetadataForItemsWithIdentifiers:bundleID:withCompletion:");
}
