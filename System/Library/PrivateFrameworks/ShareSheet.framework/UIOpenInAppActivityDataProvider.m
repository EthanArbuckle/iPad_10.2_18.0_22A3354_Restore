@implementation UIOpenInAppActivityDataProvider

void __116___UIOpenInAppActivityDataProvider_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __116___UIOpenInAppActivityDataProvider_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke_2;
      v6[3] = &unk_1E40028D0;
      v7 = v5;
      objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", CFSTR("com.apple.ShareUI.openURL.supplementalSecurityContext"), v6);

    }
  }

}

void __116___UIOpenInAppActivityDataProvider_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  UISUISecurityContext *v7;
  void *v8;
  UISUISecurityContext *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = *(id *)(a1 + 32);
  v4 = a2;
  +[UISUISecurityScopedResource scopedResourceWithFileURL:allowedAccess:](UISUIOpenInByCopySecurityScopedResource, "scopedResourceWithFileURL:allowedAccess:", v3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (+[UISUISecurityScopedResource scopedResourceWithFileURL:allowedAccess:](UISUIOpenInByCopySecurityScopedResource, "scopedResourceWithFileURL:allowedAccess:", v3, 1), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v3, "ui_bookmarkForExportWithError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBookmarkExportDataEncodedAsString:", v6);

    v7 = [UISUISecurityContext alloc];
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UISUISecurityContext initWithSecurityScopedResources:](v7, "initWithSecurityScopedResources:", v8);

  }
  else
  {
    v9 = 0;
  }

  v4[2](v4, v9, 0);
}

@end
