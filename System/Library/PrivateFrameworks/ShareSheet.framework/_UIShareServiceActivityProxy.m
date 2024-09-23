@implementation _UIShareServiceActivityProxy

+ (id)activityProxyForServiceActivityDataRequest:(id)a3
{
  id v3;
  uint64_t v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "activityCategory");
  if (v4)
  {
    if (v4 != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = &off_1E40000C8;
  }
  else
  {
    v5 = off_1E40000C0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithUnderlyingActivityItemDataRequest:", v3);
LABEL_7:

  return v6;
}

- (_UIShareServiceActivityProxy)initWithUnderlyingActivityItemDataRequest:(id)a3
{
  id v5;
  _UIShareServiceActivityProxy *v6;
  uint64_t v7;
  NSUUID *activityUUID;
  uint64_t v9;
  NSString *activityType;
  CGFloat v11;
  CGFloat v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIShareServiceActivityProxy;
  v6 = -[_UIShareServiceActivityProxy init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "activityUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    activityUUID = v6->_activityUUID;
    v6->_activityUUID = (NSUUID *)v7;

    objc_msgSend(v5, "activityType");
    v9 = objc_claimAutoreleasedReturnValue();
    activityType = v6->_activityType;
    v6->_activityType = (NSString *)v9;

    objc_storeStrong((id *)&v6->_underlyingActivityItemDataRequest, a3);
    objc_msgSend(v5, "isAirDropActivity");
    v6->_remoteClass = (Class)objc_opt_class();
    objc_msgSend(v5, "thumbnailSize");
    v6->_thumbnailSize.width = v11;
    v6->_thumbnailSize.height = v12;
  }

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIShareServiceActivityProxy;
  if (-[_UIShareServiceActivityProxy isKindOfClass:](&v6, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](self->_remoteClass, "isSubclassOfClass:", a3);
}

- (BOOL)_isExecutedInProcess
{
  return 0;
}

- (id)activityUUID
{
  return self->_activityUUID;
}

- (id)activityType
{
  return self->_activityType;
}

+ (void)forwardInvocation:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = (const char *)objc_msgSend(v3, "selector");

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("Attempt to invoke +%@ on %@, which is not supported for proxies to out-of-process activities."), v8, v4);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIShareServiceActivityProxy;
  -[_UIShareServiceActivityProxy methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    _UIShareServiceProxyRaiseInvocationUnsupportedForInstance(self, a3);
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  _UIShareServiceProxyRaiseInvocationUnsupportedForInstance(self, (const char *)objc_msgSend(a3, "selector"));
}

- (BOOL)_wantsThumbnailItemData
{
  return -[UISUIActivityExtensionItemDataRequest wantsThumbnailItemData](self->_underlyingActivityItemDataRequest, "wantsThumbnailItemData");
}

- (BOOL)_wantsAttachmentURLItemData
{
  return -[UISUIActivityExtensionItemDataRequest wantsAttachmentURLItemData](self->_underlyingActivityItemDataRequest, "wantsAttachmentURLItemData");
}

- (BOOL)_wantsInitialSocialText
{
  return 0;
}

- (BOOL)allowsEmbedding
{
  return 0;
}

- (id)activityTitle
{
  return 0;
}

- (id)activityImage
{
  return 0;
}

- (id)activityViewController
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 0;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  -[_UIShareServiceActivityProxy prepareWithActivityItems:](self, "prepareWithActivityItems:", a3);
  v6[2]();

}

- (void)activityDidFinish:(BOOL)a3
{
  -[_UIShareServiceActivityProxy activityDidFinish:items:error:](self, "activityDidFinish:items:error:", a3, 0, 0);
}

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  id didFinishPerformingActivityHandler;
  id v12;

  v6 = a3;
  v12 = a4;
  v8 = a5;
  if (self->_representationCacheURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtURL:error:", self->_representationCacheURL, 0);

  }
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AE9514](self->_didFinishPerformingActivityHandler);
  didFinishPerformingActivityHandler = self->_didFinishPerformingActivityHandler;
  self->_didFinishPerformingActivityHandler = 0;

  if (v10)
    ((void (**)(_QWORD, _BOOL8, id, id))v10)[2](v10, v6, v12, v8);

}

- (id)_embeddedActivityViewController
{
  return 0;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void (**didFinishPreparingForExecution)(id, SEL, id, BOOL, id);

  didFinishPreparingForExecution = (void (**)(id, SEL, id, BOOL, id))self->_didFinishPreparingForExecution;
  if (didFinishPreparingForExecution)
    didFinishPreparingForExecution[2](didFinishPreparingForExecution, a2, a3, a4, a5);
  return 1;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (BOOL)_needsResolvedActivityItems
{
  return 1;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 1;
}

- (BOOL)_activitySupportsPromiseURLs
{
  return -[UISUIActivityExtensionItemDataRequest activitySupportsPromiseURLs](self->_underlyingActivityItemDataRequest, "activitySupportsPromiseURLs");
}

- (CGSize)_thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_loadItemProvidersFromActivityItems:(id)a3 completion:(id)a4
{
  id v6;
  NSURL *representationCacheURL;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  representationCacheURL = self->_representationCacheURL;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79___UIShareServiceActivityProxy__loadItemProvidersFromActivityItems_completion___block_invoke;
  v9[3] = &unk_1E4003248;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  +[UIActivity _loadItemProvidersFromActivityItems:withCacheURL:completion:](UIActivity, "_loadItemProvidersFromActivityItems:withCacheURL:completion:", a3, representationCacheURL, v9);

}

- (id)didFinishPreparingForExecution
{
  return self->_didFinishPreparingForExecution;
}

- (void)setDidFinishPreparingForExecution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)didFinishPerformingActivityHandler
{
  return self->_didFinishPerformingActivityHandler;
}

- (void)setDidFinishPerformingActivityHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishPerformingActivityHandler, 0);
  objc_storeStrong(&self->_didFinishPreparingForExecution, 0);
  objc_storeStrong((id *)&self->_representationCacheURL, 0);
  objc_storeStrong((id *)&self->_underlyingActivityItemDataRequest, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end
