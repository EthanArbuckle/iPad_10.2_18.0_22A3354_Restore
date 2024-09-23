@implementation VKCVisualSearchResultItem

- (VKCVisualSearchResultItem)initWithGatingResultItem:(id)a3 domain:(id)a4
{
  id v7;
  id v8;
  VKCVisualSearchResultItem *v9;
  VKCVisualSearchResultItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKCVisualSearchResultItem;
  v9 = -[VKCVisualSearchResultItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultItem, a3);
    objc_storeStrong((id *)&v10->_domainInfo, a4);
  }

  return v10;
}

- (VKCVisualSearchResultItem)initWithSearchResultItem:(id)a3
{
  id v5;
  VKCVisualSearchResultItem *v6;
  VKCVisualSearchResultItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCVisualSearchResultItem;
  v6 = -[VKCVisualSearchResultItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchItem, a3);

  return v7;
}

- (CGRect)normalizedBoundingBox
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  MADVIVisualSearchResultItem *searchItem;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat MinX;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  -[MADVIVisualSearchGatingResultItem normalizedBoundingBox](self->_resultItem, "normalizedBoundingBox");
  searchItem = self->_searchItem;
  if (searchItem)
    -[MADVIVisualSearchResultItem normalizedBoundingBox](searchItem, "normalizedBoundingBox");
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  MinX = CGRectGetMinX(*(CGRect *)&v3);
  v17.origin.x = v8;
  v17.origin.y = v9;
  v17.size.width = v10;
  v17.size.height = v11;
  v13 = 1.0 - CGRectGetMaxY(v17);
  v14 = MinX;
  v15 = v10;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (CGPoint)normalizedIconLocation
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGPoint result;

  if (-[VKCVisualSearchResultItem _hasFocalPoint](self, "_hasFocalPoint"))
  {
    -[MADVIVisualSearchGatingDomainInfo focalPoint](self->_domainInfo, "focalPoint");
    VKMFlipPoint();
  }
  else
  {
    -[VKCVisualSearchResultItem normalizedBoundingBox](self, "normalizedBoundingBox");
    v3 = VKMCenterOfRect(v5, v6, v7, v8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)_hasFocalPoint
{
  return -[MADVIVisualSearchGatingDomainInfo hasFocalPoint](self->_domainInfo, "hasFocalPoint");
}

- (BOOL)shouldPlaceInCorner
{
  return !-[VKCVisualSearchResultItem _hasFocalPoint](self, "_hasFocalPoint");
}

- (NSString)glyphName
{
  return (NSString *)-[MADVIVisualSearchGatingDomainInfo glyphName](self->_domainInfo, "glyphName");
}

- (NSString)label
{
  return (NSString *)-[MADVIVisualSearchGatingDomainInfo displayLabel](self->_domainInfo, "displayLabel");
}

- (UIMenu)debugMenu
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VKCVisualSearchResultItem domainInfo](self, "domainInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("domain_key."));
  objc_msgSend(v5, "vk_substringFromIndex:", v6 + v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEA638];
  -[VKCVisualSearchResultItem glyphName](self, "glyphName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vk_symbolImageWithName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0x1E0CB3000uLL;
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[VKCVisualSearchResultItem domainInfo](self, "domainInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Domain"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  if (-[VKCVisualSearchResultItem _hasFocalPoint](self, "_hasFocalPoint"))
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[VKCVisualSearchResultItem normalizedBoundingBox](self, "normalizedBoundingBox");
    VKMUIStringForRect(v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@"), v23);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Focal Point"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v24;
    v12 = 0x1E0CB3000;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Focal Point"), CFSTR("(none)"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "addObject:", v25);

  v26 = *(void **)(v12 + 2368);
  -[VKCVisualSearchResultItem normalizedBoundingBox](self, "normalizedBoundingBox");
  VKMUIStringForRect(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Normalized Bounding Box: %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", &stru_1E94661A8, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  v34 = (void *)MEMORY[0x1E0CEA740];
  objc_msgSend(v8, "capitalizedString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "vk_menuWithItems:title:subtitle:image:", v3, v35, 0, v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v36;
}

- (VKCImageAnalysis)analysis
{
  return (VKCImageAnalysis *)objc_loadWeakRetained((id *)&self->_analysis);
}

- (void)setAnalysis:(id)a3
{
  objc_storeWeak((id *)&self->_analysis, a3);
}

- (MADVIVisualSearchGatingResultItem)resultItem
{
  return self->_resultItem;
}

- (void)setResultItem:(id)a3
{
  objc_storeStrong((id *)&self->_resultItem, a3);
}

- (MADVIVisualSearchResultItem)searchItem
{
  return self->_searchItem;
}

- (void)setSearchItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchItem, a3);
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(unint64_t)a3
{
  self->_queryID = a3;
}

- (MADVIVisualSearchGatingDomainInfo)domainInfo
{
  return self->_domainInfo;
}

- (void)setDomainInfo:(id)a3
{
  objc_storeStrong((id *)&self->_domainInfo, a3);
}

- (int64_t)currentInvocationType
{
  return self->_currentInvocationType;
}

- (void)setCurrentInvocationType:(int64_t)a3
{
  self->_currentInvocationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainInfo, 0);
  objc_storeStrong((id *)&self->_searchItem, 0);
  objc_storeStrong((id *)&self->_resultItem, 0);
  objc_destroyWeak((id *)&self->_analysis);
}

@end
