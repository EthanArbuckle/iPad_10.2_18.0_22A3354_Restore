@implementation PPSocialHighlightStorageGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackStreamBloomFilter, 0);
  objc_storeStrong((id *)&self->feedbackStream, 0);
}

- (void)sendEvent:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = *(void **)(a1 + 8);
    v5 = a2;
    objc_msgSend(v3, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", v5);

    -[PPSocialHighlightStorageGuardedData addToBloomFilter:](a1, v5);
  }
}

- (void)addToBloomFilter:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1 && *(_QWORD *)(a1 + 16))
  {
    v4 = (void *)MEMORY[0x1E0D80FC0];
    v11 = v3;
    objc_msgSend(v3, "highlight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "highlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domainIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "highlight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addDeletableContentWithBundleIdentifier:domainIdentifier:uniqueIdentifier:toBloomFilter:", v6, v8, v10, *(_QWORD *)(a1 + 16));

    v3 = v11;
    ++*(_QWORD *)(a1 + 24);
  }

}

@end
