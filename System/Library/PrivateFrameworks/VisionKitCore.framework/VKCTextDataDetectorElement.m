@implementation VKCTextDataDetectorElement

+ (id)dataDetectorElementFromCROutputRegion:(id)a3 parentDocument:(id)a4
{
  id v5;
  id v6;
  VKCTextDataDetectorElement *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[VKCTextDataDetectorElement initWithCROutputRegion:parentDocument:]([VKCTextDataDetectorElement alloc], "initWithCROutputRegion:parentDocument:", v6, v5);

  return v7;
}

- (VKCTextDataDetectorElement)initWithCROutputRegion:(id)a3 parentDocument:(id)a4
{
  id v6;
  id v7;
  VKCTextDataDetectorElement *v8;
  VKCTextDataDetectorElement *v9;
  void *v10;
  uint64_t v11;
  DDScannerResult *scannerResult;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKCTextDataDetectorElement;
  v8 = -[VKCBaseDataDetectorElement init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[VKCBaseElement setParentCRDocument:](v8, "setParentCRDocument:", v7);
    -[VKCBaseElement setCrOutputRegion:](v9, "setCrOutputRegion:", v6);
    -[VKCTextDataDetectorElement ddOutputRegion](v9, "ddOutputRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ddResult");
    v11 = objc_claimAutoreleasedReturnValue();
    scannerResult = v9->_scannerResult;
    v9->_scannerResult = (DDScannerResult *)v11;

    v9->_dataDetectorTypes = +[VKCBaseDataDetectorElement dataDetectorTypesForScannerResult:](VKCTextDataDetectorElement, "dataDetectorTypesForScannerResult:", v9->_scannerResult);
  }

  return v9;
}

- (VKCTextDataDetectorElement)initWithScannerResult:(id)a3
{
  id v5;
  VKCTextDataDetectorElement *v6;
  VKCTextDataDetectorElement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCTextDataDetectorElement;
  v6 = -[VKCBaseDataDetectorElement init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scannerResult, a3);
    v7->_dataDetectorTypes = +[VKCBaseDataDetectorElement dataDetectorTypesForScannerResult:](VKCTextDataDetectorElement, "dataDetectorTypesForScannerResult:", v7->_scannerResult);
  }

  return v7;
}

- (CRDataDetectorsOutputRegion)ddOutputRegion
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKCheckedDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRDataDetectorsOutputRegion *)v5;
}

- (unint64_t)dataType
{
  void *v2;
  unint64_t v3;

  -[VKCTextDataDetectorElement ddOutputRegion](self, "ddOutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataType");

  return v3;
}

- (BOOL)isTextDataDetector
{
  return 1;
}

- (BOOL)isUnitConversionDataDetector
{
  return (-[VKCTextDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes") & 0xC00) != 0;
}

- (id)scannerResult
{
  return self->_scannerResult;
}

- (_NSRange)characterRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[VKCTextDataDetectorElement scannerResult](self, "scannerResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "urlificationRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)boundingQuads
{
  NSArray *boundingQuads;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[4];
  id v14;

  boundingQuads = self->_boundingQuads;
  if (!boundingQuads)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKCBaseElement parentCRDocument](self, "parentCRDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VKCTextDataDetectorElement characterRange](self, "characterRange");
    objc_msgSend(v5, "outputRegionWithContentsOfCharacterRange:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__VKCTextDataDetectorElement_boundingQuads__block_invoke;
    v13[3] = &unk_1E9465268;
    v14 = v4;
    v9 = v4;
    objc_msgSend(v8, "enumerateContentsWithTypes:usingBlock:", 8, v13);
    v10 = (NSArray *)objc_msgSend(v9, "copy");
    v11 = self->_boundingQuads;
    self->_boundingQuads = v10;

    boundingQuads = self->_boundingQuads;
  }
  return boundingQuads;
}

void __43__VKCTextDataDetectorElement_boundingQuads__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "boundingQuad");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vkQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)children
{
  -[VKCTextDataDetectorElement createChildrenIfNecessary](self, "createChildrenIfNecessary");
  return -[VKCTextDataDetectorElement _children](self, "_children");
}

- (id)debugMenu
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  -[VKCBaseElement parentCRDocument](self, "parentCRDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VKCTextDataDetectorElement characterRange](self, "characterRange");
  objc_msgSend(v4, "substringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__15;
  v43 = __Block_byref_object_dispose__15;
  v44 = 0;
  if (vk_isSeedBuild())
    v8 = 40;
  else
    v8 = 20;
  objc_msgSend(v7, "vk_substringToIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (vk_isSeedBuild())
    v11 = 60;
  else
    v11 = 40;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "vk_substringToIndex:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v40[5];
  v40[5] = v14;

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Text"), v40[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v16);

  objc_msgSend((id)objc_opt_class(), "stringArrayForVKDataDetectorTypes:", -[VKCTextDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __39__VKCTextDataDetectorElement_debugMenu__block_invoke;
  v36[3] = &unk_1E9464108;
  v38 = &v39;
  v19 = v10;
  v37 = v19;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v36);
  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = -[VKCTextDataDetectorElement characterRange](self, "characterRange");
  VKMUIStringForRange(v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@"), v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v40[5];
  v40[5] = v24;

  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Range"), v40[5]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v26);

  -[VKCTextDataDetectorElement boundingQuads](self, "boundingQuads");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v18;
  v33[1] = 3221225472;
  v33[2] = __39__VKCTextDataDetectorElement_debugMenu__block_invoke_2;
  v33[3] = &unk_1E9464130;
  v35 = &v39;
  v28 = v19;
  v34 = v28;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v33);

  v29 = (void *)MEMORY[0x1E0CEA740];
  objc_msgSend(v17, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "vk_menuWithItems:title:subtitle:", v28, v30, v9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v39, 8);
  return v31;
}

void __39__VKCTextDataDetectorElement_debugMenu__block_invoke(uint64_t a1, uint64_t a2)
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
  objc_msgSend(MEMORY[0x1E0CEA2A8], "vk_itemWithTitle:subtitle:", CFSTR("Type"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

void __39__VKCTextDataDetectorElement_debugMenu__block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!-[VKCTextDataDetectorElement childrenCreated](self, "childrenCreated"))
  {
    -[VKCTextDataDetectorElement setChildrenCreated:](self, "setChildrenCreated:", 1);
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend((id)objc_opt_class(), "stringArrayForVKDataDetectorTypes:", -[VKCTextDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v55;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v55 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(CFSTR("VKType: "), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v9, self);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v6);
    }

    -[VKCTextDataDetectorElement scannerResult](self, "scannerResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("DDType: "), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v13, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

    -[VKCTextDataDetectorElement ddOutputRegion](self, "ddOutputRegion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ddResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v17, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

    v19 = (void *)MEMORY[0x1E0CB3940];
    -[VKCBaseElement boundingBox](self, "boundingBox");
    VKMUIStringForRect(v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Unit Bounding Box: %@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v25, self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

    v27 = (void *)MEMORY[0x1E0CB3940];
    -[VKCBaseElement parentCRDocument](self, "parentCRDocument");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[VKCTextDataDetectorElement characterRange](self, "characterRange");
    objc_msgSend(v29, "substringWithRange:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Text: %@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v33, self);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v34);

    -[VKCBaseElement imageSpaceBoundingBox](self, "imageSpaceBoundingBox");
    v39 = VKMMultiplyRectScalar(v35, v36, v37, v38, 0.5);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = (void *)MEMORY[0x1E0CB3940];
    VKMUIStringForIntegralRect(v39, v40, v42, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringWithFormat:", CFSTR("Bounding Box Rect: %@"), v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v48, self);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v49);

    VKMUIStringForRectXYSpan(v39, v41, v43, v45);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Bounding Box: "), "stringByAppendingString:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v51, self);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v52);

    v53 = (void *)objc_msgSend(v3, "copy");
    -[VKCTextDataDetectorElement set_children:](self, "set_children:", v53);

  }
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (unint64_t)crDataType
{
  return self->_crDataType;
}

- (NSArray)_children
{
  return self->__children;
}

- (void)set_children:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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
  objc_storeStrong((id *)&self->__children, 0);
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_boundingQuads, 0);
}

@end
