@implementation MTPodcast

void __65__MTPodcast_Artwork__fetchArtworkForPodcastUuid_size_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  BOOL v11;

  +[MTImageStore defaultStore](MTImageStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageForKey:size:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 72), "downloadArtworkForPodcastIfNeeded:successCallback:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_defaultPlaceholderArtworkWithSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MTPodcast_Artwork__fetchArtworkForPodcastUuid_size_completion___block_invoke_2;
  v7[3] = &unk_1EA0C5668;
  v10 = *(id *)(a1 + 40);
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v11 = v3 == 0;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __65__MTPodcast_Artwork__fetchArtworkForPodcastUuid_size_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __69__MTPodcast_Artwork__asyncDiskArtworkForPodcastUuid_size_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__MTPodcast_Artwork__downloadArtworkForPodcastIfNeeded_successCallback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

void __38__MTPodcast_Artwork___imageFetchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.podcasts.podcast-artwork", MEMORY[0x1E0C80D50]);
  v1 = (void *)_imageFetchQueue_queue;
  _imageFetchQueue_queue = (uint64_t)v0;

}

@end
