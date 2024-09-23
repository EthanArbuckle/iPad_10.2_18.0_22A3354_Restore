@implementation PUActivityItemSourceAnchorOperation

- (void)px_start
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  PUActivityItemSourceAnchorOperation *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Share Sheet: Anchor operation (%@) encountered during preparation", (uint8_t *)&v5, 0xCu);
  }

  if (-[PUActivityItemSourceAnchorOperation isCancelled](self, "isCancelled"))
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Share Sheet: Anchor operation (%@) finishing immediately", (uint8_t *)&v5, 0xCu);
    }

    -[PXAsyncOperation px_finishIfPossible](self, "px_finishIfPossible");
  }
}

- (void)signalAnchor
{
  NSObject *v3;
  int v4;
  PUActivityItemSourceAnchorOperation *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Share Sheet: Anchor operation (%@) signalled", (uint8_t *)&v4, 0xCu);
  }

  if (-[PXAsyncOperation isExecuting](self, "isExecuting"))
    -[PXAsyncOperation px_finishIfPossible](self, "px_finishIfPossible");
  else
    -[PXAsyncOperation cancel](self, "cancel");
}

@end
