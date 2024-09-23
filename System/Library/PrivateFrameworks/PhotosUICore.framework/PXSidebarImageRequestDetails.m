@implementation PXSidebarImageRequestDetails

- (PXSidebarImageRequestDetails)initWithMediaProvider:(id)a3 mediaRequestIDs:(id)a4
{
  id v7;
  id v8;
  PXSidebarImageRequestDetails *v9;
  PXSidebarImageRequestDetails *v10;
  signed int v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSidebarImageRequestDetails;
  v9 = -[PXSidebarImageRequestDetails init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    do
      v11 = __ldaxr((unsigned int *)&_nextRequestID);
    while (__stlxr(v11 + 1, (unsigned int *)&_nextRequestID));
    v9->_sidebarRequestID = v11;
    objc_storeStrong((id *)&v9->_mediaProvider, a3);
    objc_storeStrong((id *)&v10->_mediaRequestIDs, a4);
  }

  return v10;
}

- (PXSidebarImageRequestDetails)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSidebarDataController.m"), 74, CFSTR("%s is not available as initializer"), "-[PXSidebarImageRequestDetails init]");

  abort();
}

- (void)cancel
{
  void *v3;
  _QWORD v4[5];

  -[PXSidebarImageRequestDetails mediaRequestIDs](self, "mediaRequestIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__PXSidebarImageRequestDetails_cancel__block_invoke;
  v4[3] = &unk_1E5148928;
  v4[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v4);

}

- (int64_t)sidebarRequestID
{
  return self->_sidebarRequestID;
}

- (NSIndexSet)mediaRequestIDs
{
  return self->_mediaRequestIDs;
}

- (void)setMediaRequestIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_mediaRequestIDs, 0);
}

void __38__PXSidebarImageRequestDetails_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", a2);

}

@end
