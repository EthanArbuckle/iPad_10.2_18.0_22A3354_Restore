@implementation VKCTextElement

+ (id)textElementFromCROutputRegion:(id)a3 parentDocument:(id)a4
{
  id v5;
  id v6;
  VKCTextElement *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(VKCTextElement);
  -[VKCBaseElement setParentCRDocument:](v7, "setParentCRDocument:", v5);

  -[VKCBaseElement setCrOutputRegion:](v7, "setCrOutputRegion:", v6);
  return v7;
}

- (int64_t)elementType
{
  return 1;
}

- (NSArray)_children
{
  -[VKCTextElement createChildrenIfNecessary](self, "createChildrenIfNecessary");
  return self->__children;
}

- (NSArray)components
{
  -[VKCTextElement createChildrenIfNecessary](self, "createChildrenIfNecessary");
  return self->_components;
}

- (NSArray)candidates
{
  -[VKCTextElement createChildrenIfNecessary](self, "createChildrenIfNecessary");
  return self->_candidates;
}

- (BOOL)isInspectableCellSelectable
{
  return 1;
}

- (void)createChildrenIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t MinX;
  uint64_t MaxX;
  uint64_t MinY;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSArray *v65;
  NSArray *children;
  id v67;
  _QWORD v68[5];
  _QWORD v69[5];
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  if (!-[VKCTextElement childrenCreated](self, "childrenCreated"))
  {
    -[VKCTextElement setChildrenCreated:](self, "setChildrenCreated:", 1);
    v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[VKCBaseElement boundingBox](self, "boundingBox");
    VKMUIStringForRect(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Unit Bounding Box: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v9, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v10);

    -[VKCBaseElement imageSpaceBoundingBox](self, "imageSpaceBoundingBox");
    v15 = VKMMultiplyRectScalar(v11, v12, v13, v14, 0.5);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (void *)MEMORY[0x1E0CB3940];
    VKMUIStringForIntegralRect(v15, v16, v18, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Bounding Box Rect: %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v24, self);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v25);

    v26 = (void *)MEMORY[0x1E0CB3940];
    v70.origin.x = v15;
    v70.origin.y = v17;
    v70.size.width = v19;
    v70.size.height = v21;
    MinX = (int)CGRectGetMinX(v70);
    v71.origin.x = v15;
    v71.origin.y = v17;
    v71.size.width = v19;
    v71.size.height = v21;
    MaxX = (int)CGRectGetMaxX(v71);
    v72.origin.x = v15;
    v72.origin.y = v17;
    v72.size.width = v19;
    v72.size.height = v21;
    MinY = (int)CGRectGetMinY(v72);
    v73.origin.x = v15;
    v73.origin.y = v17;
    v73.size.width = v19;
    v73.size.height = v21;
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Bounding Box: X: [%d - %d] Y: [%d - %d]"), MinX, MaxX, MinY, (int)CGRectGetMaxY(v73));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v30, self);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v31);

    v32 = (void *)MEMORY[0x1E0CB3940];
    -[VKCTextElement confidenceString](self, "confidenceString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("Confidence: %@"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v34, self);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v35);

    v36 = (void *)MEMORY[0x1E0CB3940];
    -[VKCTextElement crOutputRegionTypeString](self, "crOutputRegionTypeString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("Type: %@"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v38, self);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v39);

    v40 = (void *)MEMORY[0x1E0CB3940];
    -[VKCBaseElement parentCRDocument](self, "parentCRDocument");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "rangeOfContentRegion:", v42);
    VKMUIStringForRange(v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("Range: %@"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v46, self);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v47);

    -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "children");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

    v51 = MEMORY[0x1E0C809B0];
    if (v50)
    {
      -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "children");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v51;
      v69[1] = 3221225472;
      v69[2] = __43__VKCTextElement_createChildrenIfNecessary__block_invoke;
      v69[3] = &unk_1E94649D0;
      v69[4] = self;
      objc_msgSend(v53, "vk_compactMap:", v69);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      -[VKCBaseElement quad](self, "quad");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCTextElement elementCollectionForQuad:](self, "elementCollectionForQuad:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "addObject:", v56);

      +[VKCElementCollection collectionWithTitle:children:parent:](VKCElementCollection, "collectionWithTitle:children:parent:", CFSTR("Components"), v54, self);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "addObject:", v57);

      -[VKCTextElement setComponents:](self, "setComponents:", v54);
    }
    -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "candidates");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");

    if (v60)
    {
      -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "candidates");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v51;
      v68[1] = 3221225472;
      v68[2] = __43__VKCTextElement_createChildrenIfNecessary__block_invoke_2;
      v68[3] = &unk_1E94649D0;
      v68[4] = self;
      objc_msgSend(v62, "vk_compactMap:", v68);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      +[VKCElementCollection collectionWithTitle:children:parent:](VKCElementCollection, "collectionWithTitle:children:parent:", CFSTR("Candidates"), v63, self);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "addObject:", v64);

      -[VKCTextElement setCandidates:](self, "setCandidates:", v63);
    }
    v65 = (NSArray *)objc_msgSend(v67, "copy");
    children = self->__children;
    self->__children = v65;

  }
}

id __43__VKCTextElement_createChildrenIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "parentCRDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCTextElement textElementFromCROutputRegion:parentDocument:](VKCTextElement, "textElementFromCROutputRegion:parentDocument:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__VKCTextElement_createChildrenIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "parentCRDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCTextElement textElementFromCROutputRegion:parentDocument:](VKCTextElement, "textElementFromCROutputRegion:parentDocument:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)confidenceString
{
  int v2;
  const __CFString *v3;

  v2 = -[VKCBaseElement confidence](self, "confidence");
  v3 = CFSTR("Low");
  if (v2 == 1)
    v3 = CFSTR("Medium");
  if (v2 == 2)
    return CFSTR("High");
  else
    return (id)v3;
}

- (id)crOutputRegionTypeString
{
  void *v2;
  uint64_t v3;
  id result;

  -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 <= 63)
  {
    result = CFSTR("Unknown");
    switch(v3)
    {
      case 0:
        return result;
      case 1:
        return CFSTR("Document");
      case 2:
        return CFSTR("Block");
      case 3:
      case 5:
      case 6:
      case 7:
        return CFSTR("?");
      case 4:
        return CFSTR("Paragraph");
      case 8:
        return CFSTR("Line");
      default:
        if (v3 == 16)
        {
          result = CFSTR("Word");
        }
        else
        {
          if (v3 != 32)
            return CFSTR("?");
          result = CFSTR("Character");
        }
        break;
    }
  }
  else if (v3 > 1023)
  {
    if (v3 > 4095)
    {
      if (v3 != 4096)
      {
        if (v3 == 0x2000)
          return CFSTR("DataForm");
        return CFSTR("?");
      }
      return CFSTR("DataGroup");
    }
    else
    {
      if (v3 != 1024)
      {
        if (v3 == 2048)
          return CFSTR("Data");
        return CFSTR("?");
      }
      return CFSTR("Figure");
    }
  }
  else if (v3 > 255)
  {
    if (v3 != 256)
    {
      if (v3 == 512)
        return CFSTR("List Item");
      return CFSTR("?");
    }
    return CFSTR("List");
  }
  else
  {
    if (v3 != 64)
    {
      if (v3 == 128)
        return CFSTR("TableCell");
      return CFSTR("?");
    }
    return CFSTR("Table");
  }
  return result;
}

- (id)elementCollectionForQuad:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "topLeft");
  v7 = v6;
  objc_msgSend(v5, "topLeft");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("TL: X: %.02f Y:%0.2f"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v10;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "topRight");
  v13 = v12;
  objc_msgSend(v5, "topRight");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("TR: X: %.02f Y:%0.2f"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v16;
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "bottomLeft");
  v19 = v18;
  objc_msgSend(v5, "bottomLeft");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("BL: X: %.02f Y:%0.2f"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v22;
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "bottomRight");
  v25 = v24;
  objc_msgSend(v5, "bottomRight");
  v27 = v26;

  objc_msgSend(v23, "stringWithFormat:", CFSTR("BR: X: %.02f Y:%0.2f"), v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v28, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[VKCElementCollection collectionWithTitle:children:parent:](VKCElementCollection, "collectionWithTitle:children:parent:", CFSTR("Quad"), v30, self);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)setComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)set_children:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
