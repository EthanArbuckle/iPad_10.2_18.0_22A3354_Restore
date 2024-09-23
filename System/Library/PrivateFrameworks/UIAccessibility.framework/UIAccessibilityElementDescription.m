@implementation UIAccessibilityElementDescription

+ (id)descriptionWithElement:(id)a3 frameInContainerSpaceOrNil:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CF40C8], "elementWithUIElement:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_descriptionWithAXElement:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1, "_descriptionWithAXElement:", v9);
    else
      objc_msgSend(a1, "_descriptionWithLocalElement:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectIsEmpty(v13))
  {
    objc_msgSend(v11, "setFrameInContainerSpace:", x, y, width, height);
    objc_msgSend(v11, "setFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }

  return v11;
}

+ (id)_descriptionWithLocalElement:(id)a3
{
  id v3;
  UIAccessibilityElementDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double x;
  double y;
  double width;
  double height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;

  v3 = a3;
  v4 = objc_alloc_init(UIAccessibilityElementDescription);
  -[UIAccessibilityElementDescription setIsAccessibleElement:](v4, "setIsAccessibleElement:", objc_msgSend(v3, "isAccessibilityElement"));
  -[UIAccessibilityElementDescription setTraits:](v4, "setTraits:", objc_msgSend(v3, "accessibilityTraits"));
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setLabel:](v4, "setLabel:", v5);

  objc_msgSend(v3, "accessibilityAttributedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setAttributedLabel:](v4, "setAttributedLabel:", v6);

  objc_msgSend(v3, "accessibilityValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setValue:](v4, "setValue:", v7);

  objc_msgSend(v3, "accessibilityAttributedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setAttributedValue:](v4, "setAttributedValue:", v8);

  objc_msgSend(v3, "accessibilityUserInputLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setUserInputLabels:](v4, "setUserInputLabels:", v9);

  objc_msgSend(v3, "accessibilityAttributedUserInputLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setAttributedUserInputLabels:](v4, "setAttributedUserInputLabels:", v10);

  objc_msgSend(v3, "accessibilityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setIdentifier:](v4, "setIdentifier:", v11);

  v12 = *MEMORY[0x1E0C9D628];
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "accessibilityFrameInContainerSpace");
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    if (!CGRectIsEmpty(v33))
      goto LABEL_8;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v3, "accessibilityFrame");
        height = v15;
        width = v14;
        y = v13;
        x = v12;
        v15 = v29;
        v14 = v30;
        v13 = v31;
        v12 = v32;
        goto LABEL_8;
      }
    }
    objc_msgSend(v3, "frame");
    x = v20;
    y = v21;
    width = v22;
    height = v23;
  }
  objc_msgSend(v3, "accessibilityFrame");
  v12 = v24;
  v13 = v25;
  v14 = v26;
  v15 = v27;
LABEL_8:
  -[UIAccessibilityElementDescription setFrame:](v4, "setFrame:", v12, v13, v14, v15);
  -[UIAccessibilityElementDescription setFrameInContainerSpace:](v4, "setFrameInContainerSpace:", x, y, width, height);

  return v4;
}

+ (id)_descriptionWithAXElement:(id)a3
{
  id v3;
  UIAccessibilityElementDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  const CGPath *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *Data;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  UIAccessibilityElementDescription *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(UIAccessibilityElementDescription);
  -[UIAccessibilityElementDescription setIsAccessibleElement:](v4, "setIsAccessibleElement:", objc_msgSend(v3, "isAccessibleElement"));
  -[UIAccessibilityElementDescription setTraits:](v4, "setTraits:", objc_msgSend(v3, "traits"));
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setLabel:](v4, "setLabel:", v5);

  objc_msgSend(v3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setValue:](v4, "setValue:", v6);

  objc_msgSend(v3, "userInputLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setUserInputLabels:](v4, "setUserInputLabels:", v7);

  objc_msgSend(v3, "uiElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithAXAttribute:", 5019);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription setIdentifier:](v4, "setIdentifier:", v9);

  objc_msgSend(v3, "frame");
  v10 = *MEMORY[0x1E0C9D628];
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[UIAccessibilityElementDescription setFrame:](v4, "setFrame:");
  -[UIAccessibilityElementDescription setFrameInContainerSpace:](v4, "setFrameInContainerSpace:", v10, v11, v12, v13);
  v14 = (const CGPath *)objc_msgSend(v3, "path");
  if (!CGPathIsEmpty(v14))
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setPath:](v4, "setPath:", v15);

  }
  v36 = v4;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "customActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = 0;
    do
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v3, "customActions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CustomActionIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("CustomActionIdentifier"));

      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CustomActionImage"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("CustomActionImage"));

      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CustomActionName"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("CustomActionName"));

      objc_msgSend(v16, "addObject:", v20);
      ++v19;
      objc_msgSend(v3, "customActions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

    }
    while (v27 > v19);
  }
  -[UIAccessibilityElementDescription setCustomActionsForRemoteDevice:](v4, "setCustomActionsForRemoteDevice:", v16);
  if (objc_msgSend(v3, "elementRef"))
  {
    Data = (void *)_AXUIElementCreateData();
    -[UIAccessibilityElementDescription setElementRefData:](v4, "setElementRefData:", Data);

  }
  v29 = (void *)objc_msgSend(&unk_1E3E10EA0, "mutableCopy");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v30 = objc_msgSend(&unk_1E3E10E88, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(&unk_1E3E10E88);
        v34 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v3, "supportsAction:", objc_msgSend(v34, "integerValue")))
          objc_msgSend(v29, "addObject:", v34);
      }
      v31 = objc_msgSend(&unk_1E3E10E88, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v31);
  }
  -[UIAccessibilityElementDescription setAccessibilityActionsForRemoteDevice:](v36, "setAccessibilityActionsForRemoteDevice:", v29);

  return v36;
}

- (UIAccessibilityElementDescription)init
{
  UIAccessibilityElementDescription *result;
  CGPoint v3;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElementDescription;
  result = -[UIAccessibilityElementDescription init](&v5, sel_init);
  if (result)
  {
    v3 = (CGPoint)*MEMORY[0x1E0C9D628];
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_frame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_frame.size = v4;
    result->_frameInContainerSpace.origin = v3;
    result->_frameInContainerSpace.size = v4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAccessibilityElementDescription)initWithCoder:(id)a3
{
  id v4;
  UIAccessibilityElementDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIAccessibilityElementDescription;
  v5 = -[UIAccessibilityElementDescription init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setLabel:](v5, "setLabel:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setAttributedLabel:](v5, "setAttributedLabel:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setValue:](v5, "setValue:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setAttributedValue:](v5, "setAttributedValue:", v9);

    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("frame"));
    -[UIAccessibilityElementDescription setFrame:](v5, "setFrame:");
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("frameInContainerSpace"));
    -[UIAccessibilityElementDescription setFrameInContainerSpace:](v5, "setFrameInContainerSpace:");
    -[UIAccessibilityElementDescription setIsAccessibleElement:](v5, "setIsAccessibleElement:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAccessibleElement")));
    -[UIAccessibilityElementDescription setTraits:](v5, "setTraits:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("traits")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setPath:](v5, "setPath:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("customActionsForRemoteDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setCustomActionsForRemoteDevice:](v5, "setCustomActionsForRemoteDevice:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elementRefData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setElementRefData:](v5, "setElementRefData:", v18);

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("accessibilityActionsForRemoteDevice"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setAccessibilityActionsForRemoteDevice:](v5, "setAccessibilityActionsForRemoteDevice:", v22);

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("userInputLabels"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setUserInputLabels:](v5, "setUserInputLabels:", v26);

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("attributedUserInputLabels"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setAttributedUserInputLabels:](v5, "setAttributedUserInputLabels:", v30);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElementDescription setIdentifier:](v5, "setIdentifier:", v31);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[UIAccessibilityElementDescription label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("label"));

  -[UIAccessibilityElementDescription attributedLabel](self, "attributedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("attributedLabel"));

  -[UIAccessibilityElementDescription value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("value"));

  -[UIAccessibilityElementDescription attributedValue](self, "attributedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("attributedValue"));

  -[UIAccessibilityElementDescription frame](self, "frame");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("frame"));
  -[UIAccessibilityElementDescription frameInContainerSpace](self, "frameInContainerSpace");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("frameInContainerSpace"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UIAccessibilityElementDescription isAccessibleElement](self, "isAccessibleElement"), CFSTR("isAccessibleElement"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[UIAccessibilityElementDescription traits](self, "traits"), CFSTR("traits"));
  -[UIAccessibilityElementDescription path](self, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("path"));

  -[UIAccessibilityElementDescription userInputLabels](self, "userInputLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("userInputLabels"));

  -[UIAccessibilityElementDescription attributedUserInputLabels](self, "attributedUserInputLabels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("attributedUserInputLabels"));

  -[UIAccessibilityElementDescription identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("identifier"));

  -[UIAccessibilityElementDescription customActionsForRemoteDevice](self, "customActionsForRemoteDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("customActionsForRemoteDevice"));

  -[UIAccessibilityElementDescription elementRefData](self, "elementRefData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("elementRefData"));

  -[UIAccessibilityElementDescription accessibilityActionsForRemoteDevice](self, "accessibilityActionsForRemoteDevice");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("accessibilityActionsForRemoteDevice"));

}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[UIAccessibilityElementDescription isAccessibilityElement](self, "isAccessibilityElement"))
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  -[UIAccessibilityElementDescription label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription attributedLabel](self, "attributedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription attributedValue](self, "attributedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription frame](self, "frame");
  NSStringFromCGRect(v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementDescription frameInContainerSpace](self, "frameInContainerSpace");
  NSStringFromCGRect(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UIAXElemDesc<%p> isAX:%@ label:'%@' attrLabel:'%@' value:'%@' attrValue:'%@' frame:'%@' localFrame:'%@' "), self, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)convertToAccessibilityElementWithContainer:(id)a3
{
  UIAccessibilityBridgeElement *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  UIAccessibilityBridgeElement *v34;
  id v35;
  CGRect v36;

  v32 = a3;
  v4 = -[UIAccessibilityBridgeElement initWithAccessibilityContainer:]([UIAccessibilityBridgeElement alloc], "initWithAccessibilityContainer:", v32);
  -[UIAccessibilityBridgeElement setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", -[UIAccessibilityElementDescription isAccessibleElement](self, "isAccessibleElement"));
  -[UIAccessibilityBridgeElement setAccessibilityTraits:](v4, "setAccessibilityTraits:", -[UIAccessibilityElementDescription traits](self, "traits"));
  -[UIAccessibilityElementDescription identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityBridgeElement setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v5);

  -[UIAccessibilityElementDescription attributedLabel](self, "attributedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIAccessibilityElementDescription attributedLabel](self, "attributedLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeElement setAccessibilityAttributedLabel:](v4, "setAccessibilityAttributedLabel:", v7);
  }
  else
  {
    -[UIAccessibilityElementDescription label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeElement setAccessibilityLabel:](v4, "setAccessibilityLabel:", v7);
  }

  -[UIAccessibilityElementDescription attributedValue](self, "attributedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIAccessibilityElementDescription attributedValue](self, "attributedValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeElement setAccessibilityAttributedValue:](v4, "setAccessibilityAttributedValue:", v9);
  }
  else
  {
    -[UIAccessibilityElementDescription value](self, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeElement setAccessibilityValue:](v4, "setAccessibilityValue:", v9);
  }

  -[UIAccessibilityElementDescription frameInContainerSpace](self, "frameInContainerSpace");
  if (CGRectIsEmpty(v36))
  {
    -[UIAccessibilityElementDescription frame](self, "frame");
    -[UIAccessibilityBridgeElement setAccessibilityFrame:](v4, "setAccessibilityFrame:");
  }
  else
  {
    -[UIAccessibilityElementDescription frameInContainerSpace](self, "frameInContainerSpace");
    -[UIAccessibilityBridgeElement setAccessibilityFrameInContainerSpace:](v4, "setAccessibilityFrameInContainerSpace:");
  }
  -[UIAccessibilityElementDescription path](self, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIAccessibilityElementDescription path](self, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeElement setAccessibilityPath:](v4, "setAccessibilityPath:", v11);

  }
  -[UIAccessibilityElementDescription attributedUserInputLabels](self, "attributedUserInputLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIAccessibilityElementDescription attributedUserInputLabels](self, "attributedUserInputLabels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeElement setAccessibilityAttributedUserInputLabels:](v4, "setAccessibilityAttributedUserInputLabels:", v13);
  }
  else
  {
    -[UIAccessibilityElementDescription userInputLabels](self, "userInputLabels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeElement setAccessibilityUserInputLabels:](v4, "setAccessibilityUserInputLabels:", v13);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIAccessibilityElementDescription customActionsForRemoteDevice](self, "customActionsForRemoteDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = 0;
    do
    {
      -[UIAccessibilityElementDescription customActionsForRemoteDevice](self, "customActionsForRemoteDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_alloc(MEMORY[0x1E0CEA638]);
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CustomActionImage"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithData:", v21);

      v23 = objc_alloc(MEMORY[0x1E0CEA280]);
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CustomActionName"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __80__UIAccessibilityElementDescription_convertToAccessibilityElementWithContainer___block_invoke;
      v33[3] = &unk_1E3DFFAA8;
      v34 = v4;
      v35 = v19;
      v25 = v19;
      v26 = (void *)objc_msgSend(v23, "initWithName:image:actionHandler:", v24, v22, v33);

      objc_msgSend(v14, "addObject:", v26);
      ++v17;
      -[UIAccessibilityElementDescription customActionsForRemoteDevice](self, "customActionsForRemoteDevice");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

    }
    while (v28 > v17);
  }
  -[UIAccessibilityBridgeElement setAccessibilityCustomActions:](v4, "setAccessibilityCustomActions:", v14);
  -[UIAccessibilityElementDescription elementRefData](self, "elementRefData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityBridgeElement setElementRefData:](v4, "setElementRefData:", v29);

  -[UIAccessibilityElementDescription accessibilityActionsForRemoteDevice](self, "accessibilityActionsForRemoteDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityBridgeElement setAccessibilityActionsForRemoteDevice:](v4, "setAccessibilityActionsForRemoteDevice:", v30);

  return v4;
}

uint64_t __80__UIAccessibilityElementDescription_convertToAccessibilityElementWithContainer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "axActionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CustomActionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "performAXAction:withValue:onBridgeElement:", 2021, v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isAccessibleElement
{
  return self->_isAccessibleElement;
}

- (void)setIsAccessibleElement:(BOOL)a3
{
  self->_isAccessibleElement = a3;
}

- (unint64_t)traits
{
  return self->_traits;
}

- (void)setTraits:(unint64_t)a3
{
  self->_traits = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSAttributedString)attributedLabel
{
  return self->_attributedLabel;
}

- (void)setAttributedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_attributedLabel, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSAttributedString)attributedValue
{
  return self->_attributedValue;
}

- (void)setAttributedValue:(id)a3
{
  objc_storeStrong((id *)&self->_attributedValue, a3);
}

- (CGRect)frameInContainerSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameInContainerSpace.origin.x;
  y = self->_frameInContainerSpace.origin.y;
  width = self->_frameInContainerSpace.size.width;
  height = self->_frameInContainerSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameInContainerSpace:(CGRect)a3
{
  self->_frameInContainerSpace = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (NSArray)userInputLabels
{
  return self->_userInputLabels;
}

- (void)setUserInputLabels:(id)a3
{
  objc_storeStrong((id *)&self->_userInputLabels, a3);
}

- (NSArray)attributedUserInputLabels
{
  return self->_attributedUserInputLabels;
}

- (void)setAttributedUserInputLabels:(id)a3
{
  objc_storeStrong((id *)&self->_attributedUserInputLabels, a3);
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSArray)customActionsForRemoteDevice
{
  return self->_customActionsForRemoteDevice;
}

- (void)setCustomActionsForRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_customActionsForRemoteDevice, a3);
}

- (NSData)elementRefData
{
  return self->_elementRefData;
}

- (void)setElementRefData:(id)a3
{
  objc_storeStrong((id *)&self->_elementRefData, a3);
}

- (NSArray)accessibilityActionsForRemoteDevice
{
  return self->_accessibilityActionsForRemoteDevice;
}

- (void)setAccessibilityActionsForRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityActionsForRemoteDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityActionsForRemoteDevice, 0);
  objc_storeStrong((id *)&self->_elementRefData, 0);
  objc_storeStrong((id *)&self->_customActionsForRemoteDevice, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_attributedUserInputLabels, 0);
  objc_storeStrong((id *)&self->_userInputLabels, 0);
  objc_storeStrong((id *)&self->_attributedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_attributedLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
