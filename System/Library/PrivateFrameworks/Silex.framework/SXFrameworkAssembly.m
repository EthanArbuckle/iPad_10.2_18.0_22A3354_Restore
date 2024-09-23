@implementation SXFrameworkAssembly

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (SXFrameworkAssembly)init
{
  SXFrameworkAssembly *v2;
  id v3;
  SXAudioComponentAssembly *v4;
  SXWebContentComponentAssembly *v5;
  SXQuickLookComponentAssembly *v6;
  SXFlexibleSpacerComponentAssembly *v7;
  SXButtonComponentAssembly *v8;
  SXSubscriptionButtonComponentAssembly *v9;
  SXIssueCoverComponentAssembly *v10;
  SXPlaceholderArticleThumbnailComponentAssembly *v11;
  SXArticleLinkComponentAssembly *v12;
  SXAdvertisementComponentAssembly *v13;
  uint64_t v14;
  NSArray *assemblies;
  SXSectionComponentAssembly *v17;
  SXMosaicGalleryComponentAssembly *v18;
  SXStripGalleryComponentAssembly *v19;
  void *v20;
  SXMapComponentAssembly *v21;
  SXScalableImageComponentAssembly *v22;
  SXLineComponentAssembly *v23;
  SXImageComponentAssembly *v24;
  SXEmbedComponentAssembly *v25;
  SXEmbedVideoComponentAssembly *v26;
  SXDataTableComponentAssembly *v27;
  SXContainerComponentAssembly *v28;
  SXVideoComponentAssembly *v29;
  SXTextComponentAssembly *v30;
  SXFormatAssembly *v31;
  SXNewsletterAssembly *v32;
  SXRenderingConfigurationAssembly *v33;
  SXManagerAssembly *v34;
  SXLayoutAssembly *v35;
  SXOfferUpsellScenarioAssembly *v36;
  SXSubscriptionAssembly *v37;
  SXQuickLookAssembly *v38;
  SXComponentInsertionAssembly *v39;
  SXAdAssembly *v40;
  SXStyleAssembly *v41;
  SXFullscreenAssembly *v42;
  SXBookmarkAssembly *v43;
  SXActionAssembly *v44;
  SXTangierAssembly *v45;
  SXComponentAssembly *v46;
  SXDOMAssembly *v47;
  SXCoreAssembly *v48;
  void *v49;
  SXFrameworkAssembly *v50;
  objc_super v51;
  _QWORD v52[43];

  v52[41] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)SXFrameworkAssembly;
  v2 = -[SXFrameworkAssembly init](&v51, sel_init);
  if (v2)
  {
    SXSetupLogging();
    v50 = v2;
    v3 = objc_alloc_init(MEMORY[0x24BE907A0]);
    objc_msgSend(v3, "assemblies");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_alloc_init(SXCoreAssembly);
    v52[0] = v48;
    v47 = objc_alloc_init(SXDOMAssembly);
    v52[1] = v47;
    v46 = objc_alloc_init(SXComponentAssembly);
    v52[2] = v46;
    v45 = objc_alloc_init(SXTangierAssembly);
    v52[3] = v45;
    v44 = objc_alloc_init(SXActionAssembly);
    v52[4] = v44;
    v43 = objc_alloc_init(SXBookmarkAssembly);
    v52[5] = v43;
    v42 = objc_alloc_init(SXFullscreenAssembly);
    v52[6] = v42;
    v41 = objc_alloc_init(SXStyleAssembly);
    v52[7] = v41;
    v40 = objc_alloc_init(SXAdAssembly);
    v52[8] = v40;
    v39 = objc_alloc_init(SXComponentInsertionAssembly);
    v52[9] = v39;
    v38 = objc_alloc_init(SXQuickLookAssembly);
    v52[10] = v38;
    v37 = objc_alloc_init(SXSubscriptionAssembly);
    v52[11] = v37;
    v36 = objc_alloc_init(SXOfferUpsellScenarioAssembly);
    v52[12] = v36;
    v35 = objc_alloc_init(SXLayoutAssembly);
    v52[13] = v35;
    v34 = objc_alloc_init(SXManagerAssembly);
    v52[14] = v34;
    v33 = objc_alloc_init(SXRenderingConfigurationAssembly);
    v52[15] = v33;
    v32 = objc_alloc_init(SXNewsletterAssembly);
    v52[16] = v32;
    v31 = objc_alloc_init(SXFormatAssembly);
    v52[17] = v31;
    v30 = objc_alloc_init(SXTextComponentAssembly);
    v52[18] = v30;
    v29 = objc_alloc_init(SXVideoComponentAssembly);
    v52[19] = v29;
    v28 = objc_alloc_init(SXContainerComponentAssembly);
    v52[20] = v28;
    v27 = objc_alloc_init(SXDataTableComponentAssembly);
    v52[21] = v27;
    v26 = objc_alloc_init(SXEmbedVideoComponentAssembly);
    v52[22] = v26;
    v25 = objc_alloc_init(SXEmbedComponentAssembly);
    v52[23] = v25;
    v24 = objc_alloc_init(SXImageComponentAssembly);
    v52[24] = v24;
    v23 = objc_alloc_init(SXLineComponentAssembly);
    v52[25] = v23;
    v22 = objc_alloc_init(SXScalableImageComponentAssembly);
    v52[26] = v22;
    v21 = objc_alloc_init(SXMapComponentAssembly);
    v52[27] = v21;
    v19 = objc_alloc_init(SXStripGalleryComponentAssembly);
    v52[28] = v19;
    v18 = objc_alloc_init(SXMosaicGalleryComponentAssembly);
    v52[29] = v18;
    v17 = objc_alloc_init(SXSectionComponentAssembly);
    v52[30] = v17;
    v4 = objc_alloc_init(SXAudioComponentAssembly);
    v52[31] = v4;
    v5 = objc_alloc_init(SXWebContentComponentAssembly);
    v52[32] = v5;
    v6 = objc_alloc_init(SXQuickLookComponentAssembly);
    v52[33] = v6;
    v7 = objc_alloc_init(SXFlexibleSpacerComponentAssembly);
    v52[34] = v7;
    v8 = objc_alloc_init(SXButtonComponentAssembly);
    v52[35] = v8;
    v9 = objc_alloc_init(SXSubscriptionButtonComponentAssembly);
    v52[36] = v9;
    v10 = objc_alloc_init(SXIssueCoverComponentAssembly);
    v52[37] = v10;
    v11 = objc_alloc_init(SXPlaceholderArticleThumbnailComponentAssembly);
    v52[38] = v11;
    v12 = objc_alloc_init(SXArticleLinkComponentAssembly);
    v52[39] = v12;
    v13 = objc_alloc_init(SXAdvertisementComponentAssembly);
    v52[40] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 41);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v50;
    objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v20);
    v14 = objc_claimAutoreleasedReturnValue();
    assemblies = v50->_assemblies;
    v50->_assemblies = (NSArray *)v14;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assemblies, 0);
}

@end
