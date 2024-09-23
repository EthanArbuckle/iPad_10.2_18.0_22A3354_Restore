@implementation VKCMRCDataDetectorElement

- (VKCMRCDataDetectorElement)initWithBarcodeObservation:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VKCMRCDataDetectorElement;
  v9 = -[VKCBaseDataDetectorElement init](&v20, sel_init);
  if (v9)
  {
    if (!v8)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "action", "-[VKCMRCDataDetectorElement initWithBarcodeObservation:action:]", 0, 0, CFSTR("init for a Barcode Observtation, but there is no action"));
    objc_storeStrong((id *)v9 + 15, a3);
    objc_msgSend(v7, "vkQuad");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v9 + 13);
    *((_QWORD *)v9 + 13) = v10;

    objc_msgSend(v9, "quad");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "boundingBox");
    *((_QWORD *)v9 + 19) = v13;
    *((_QWORD *)v9 + 20) = v14;
    *((_QWORD *)v9 + 21) = v15;
    *((_QWORD *)v9 + 22) = v16;

    v17 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v9 + 184) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v9 + 200) = v17;
    v18 = *((_QWORD *)v9 + 12) | 0x200000;
    if (!v8)
      v18 = 0;
    *((_QWORD *)v9 + 12) = v18;
    objc_storeStrong((id *)v9 + 16, a4);
    objc_msgSend(*((id *)v9 + 16), "setDelegate:", v9);
    objc_msgSend(v9, "createChildrenIfNecessary");
  }

  return (VKCMRCDataDetectorElement *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VKCMRCDataDetectorElement barcodeObservation](self, "barcodeObservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("BCO"));

  -[VKCMRCDataDetectorElement scannerResult](self, "scannerResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Action"));

}

- (VKCMRCDataDetectorElement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  VKCMRCDataDetectorElement *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCO"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v6 = (void *)getBCSActionClass_softClass;
  v15 = getBCSActionClass_softClass;
  if (!getBCSActionClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getBCSActionClass_block_invoke;
    v11[3] = &unk_1E9462330;
    v11[4] = &v12;
    __getBCSActionClass_block_invoke((uint64_t)v11);
    v6 = (void *)v13[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("Action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VKCMRCDataDetectorElement initWithBarcodeObservation:action:](self, "initWithBarcodeObservation:action:", v5, v8);

  return v9;
}

- (id)debugMenu
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  v36 = 0;
  objc_msgSend((id)objc_opt_class(), "stringArrayForVKDataDetectorTypes:", -[VKCMRCDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __38__VKCMRCDataDetectorElement_debugMenu__block_invoke;
  v28[3] = &unk_1E9464108;
  v30 = &v31;
  v6 = v3;
  v29 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v28);
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[VKCMRCDataDetectorElement barcodeObservation](self, "barcodeObservation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadStringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v32[5];
  v32[5] = v10;

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Payload"), v32[5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[VKCMRCDataDetectorElement barcodeObservation](self, "barcodeObservation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "symbology");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v32[5];
  v32[5] = v16;

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Symbology"), v32[5]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v18);

  -[VKCMRCDataDetectorElement boundingQuads](self, "boundingQuads");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __38__VKCMRCDataDetectorElement_debugMenu__block_invoke_2;
  v25[3] = &unk_1E9464130;
  v27 = &v31;
  v20 = v6;
  v26 = v20;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v25);

  -[VKCMRCDataDetectorElement barcodeAction](self, "barcodeAction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "actionIcon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA740], "vk_menuWithItems:title:subtitle:image:", v20, CFSTR("MRC"), 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v31, 8);
  return v23;
}

void __38__VKCMRCDataDetectorElement_debugMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("VKType"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

void __38__VKCMRCDataDetectorElement_debugMenu__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "summaryDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Quad"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (void)createChildrenIfNecessary
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSArray *children;
  __CFString *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!-[VKCMRCDataDetectorElement childrenCreated](self, "childrenCreated"))
  {
    -[VKCMRCDataDetectorElement setChildrenCreated:](self, "setChildrenCreated:", 1);
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKCMRCDataDetectorElement barcodeObservation](self, "barcodeObservation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadStringValue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = CFSTR("nil");
    v8 = v7;

    objc_msgSend(CFSTR("Payload String: "), "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v9, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    -[VKCMRCDataDetectorElement barcodeObservation](self, "barcodeObservation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "symbology");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Symbology: "), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v13, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

    if (-[VKCMRCDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"))
    {
      v40 = v8;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend((id)objc_opt_class(), "stringArrayForVKDataDetectorTypes:", -[VKCMRCDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v42 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(CFSTR("VKType: "), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v20, self);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v21);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v17);
      }

      v8 = v40;
    }
    else
    {
      v22 = +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", CFSTR("VKType: VKDataDetectorTypeNone"), self);
    }
    -[VKCMRCDataDetectorElement scannerResult](self, "scannerResult");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "type");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (__CFString *)v24;
    else
      v26 = CFSTR("nil");
    v27 = v26;

    objc_msgSend(CFSTR("DDType: "), "stringByAppendingString:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v28, self);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

    v30 = (void *)MEMORY[0x1E0CB3940];
    -[VKCMRCDataDetectorElement boundingBox](self, "boundingBox");
    VKMUIStringForRect(v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Unit Bounding Box: %@"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v36, self);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v37);

    v38 = (NSArray *)objc_msgSend(v3, "copy");
    children = self->_children;
    self->_children = v38;

  }
}

- (UIMenu)mrcMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VKCMRCDataDetectorElement barcodeAction](self, "barcodeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEA740];
  objc_msgSend(v2, "contentPreviewString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menuWithTitle:image:identifier:options:children:", v4, v5, 0, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v7;
}

- (id)scannerResult
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)boundingQuads
{
  NSArray *boundingQuads;
  uint64_t v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  boundingQuads = self->_boundingQuads;
  if (!boundingQuads)
  {
    -[VKCMRCDataDetectorElement quad](self, "quad");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_boundingQuads;
      self->_boundingQuads = v6;
    }
    else
    {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((quad) != nil)", "-[VKCMRCDataDetectorElement boundingQuads]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "quad");
      v7 = self->_boundingQuads;
      self->_boundingQuads = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    boundingQuads = self->_boundingQuads;
  }
  return boundingQuads;
}

- (BOOL)isMRCDataDetector
{
  return 1;
}

- (id)stringValue
{
  return VKMUIStringForDDTypes(-[VKCMRCDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
}

- (id)presentingViewControllerForAction:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  -[VKCMRCDataDetectorElement presentingViewControllerForMrcAction](self, "presentingViewControllerForMrcAction", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D2E0D000, v4, OS_LOG_TYPE_INFO, "Using the key window's root view controller for BCSAction's presenting view controller.", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (CGRect)sourceRectForPopoverActionPicker:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect result;

  -[VKCMRCDataDetectorElement delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VKCMRCDataDetectorElement delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCMRCDataDetectorElement barcodeAction](self, "barcodeAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCMRCDataDetectorElement presentingViewControllerForAction:](self, "presentingViewControllerForAction:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rectForMrcActionInViewController:", v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    -[VKCMRCDataDetectorElement rectForMrcActionInPresentingViewController](self, "rectForMrcActionInPresentingViewController");
    if (CGRectIsNull(v24))
    {
      v9 = *MEMORY[0x1E0C9D648];
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[VKCMRCDataDetectorElement rectForMrcActionInPresentingViewController](self, "rectForMrcActionInPresentingViewController");
      v9 = v16;
      v11 = v17;
      v13 = v18;
      v15 = v19;
    }
  }
  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (id)children
{
  return self->_children;
}

- (VNBarcodeObservation)barcodeObservation
{
  return self->_barcodeObservation;
}

- (void)setBarcodeObservation:(id)a3
{
  objc_storeStrong((id *)&self->_barcodeObservation, a3);
}

- (BCSAction)barcodeAction
{
  return self->_barcodeAction;
}

- (void)setBarcodeAction:(id)a3
{
  objc_storeStrong((id *)&self->_barcodeAction, a3);
}

- (UIViewController)presentingViewControllerForMrcAction
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewControllerForMrcAction);
}

- (void)setPresentingViewControllerForMrcAction:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewControllerForMrcAction, a3);
}

- (VKCMRCDataDetectorElementDelegate)delegate
{
  return (VKCMRCDataDetectorElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)rectForMrcActionInPresentingViewController
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectForMrcActionInPresentingViewController.origin.x;
  y = self->_rectForMrcActionInPresentingViewController.origin.y;
  width = self->_rectForMrcActionInPresentingViewController.size.width;
  height = self->_rectForMrcActionInPresentingViewController.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3
{
  self->_rectForMrcActionInPresentingViewController = a3;
}

- (BOOL)childrenCreated
{
  return self->_childrenCreated;
}

- (void)setChildrenCreated:(BOOL)a3
{
  self->_childrenCreated = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewControllerForMrcAction);
  objc_storeStrong((id *)&self->_barcodeAction, 0);
  objc_storeStrong((id *)&self->_barcodeObservation, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_boundingQuads, 0);
}

@end
