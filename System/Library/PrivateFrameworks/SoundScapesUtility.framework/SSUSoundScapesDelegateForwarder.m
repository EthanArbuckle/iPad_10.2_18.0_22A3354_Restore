@implementation SSUSoundScapesDelegateForwarder

uint64_t __61___SSUSoundScapesDelegateForwarder_mediaPickerConfirmChoices__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaPickerDidSelectPlaybackArchive:withError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  return objc_msgSend(*(id *)(a1 + 32), "cleanup");
}

uint64_t __66___SSUSoundScapesDelegateForwarder_selectedSoundScapes_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNavigationItem");
}

uint64_t __50___SSUSoundScapesDelegateForwarder_requestDismiss__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaPickerCancelled");

  return objc_msgSend(*(id *)(a1 + 32), "cleanup");
}

void __43___SSUSoundScapesDelegateForwarder_cleanup__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

@end
