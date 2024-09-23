@implementation TMLUITraitCollection

- (TMLUITraitCollection)init
{
  TMLUITraitCollection *v2;
  TMLUITraitCollection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TMLUITraitCollection;
  v2 = -[TMLUITraitCollection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_horizontalSizeClass = 0;
    v2->_verticalSizeClass = 0;
    *(_OWORD *)&v2->_userInterfaceStyle = xmmword_22AD83830;
    v2->_forceTouchCapability = 0;
    objc_storeStrong((id *)&v2->_preferredContentSizeCategory, (id)*MEMORY[0x24BDF76C0]);
  }
  return v3;
}

- (void)tmlDispose
{
  id subviewsValue;
  id constraintsValue;
  NSMutableDictionary *properties;
  NSMutableOrderedSet *propertyKeys;
  objc_super v7;

  subviewsValue = self->_subviewsValue;
  self->_subviewsValue = 0;

  constraintsValue = self->_constraintsValue;
  self->_constraintsValue = 0;

  properties = self->_properties;
  self->_properties = 0;

  propertyKeys = self->_propertyKeys;
  self->_propertyKeys = 0;

  v7.receiver = self;
  v7.super_class = (Class)TMLUITraitCollection;
  -[NSObject tmlDispose](&v7, sel_tmlDispose);
}

+ (id)defaultCollection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AD3A2C0;
  block[3] = &unk_24F4FD280;
  block[4] = a1;
  if (qword_255B51B10 != -1)
    dispatch_once(&qword_255B51B10, block);
  return (id)qword_255B51B08;
}

- (void)setTMLValue:(id)a3 forKeyPath:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  id *p_subviewsValue;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  NSMutableDictionary *properties;
  id v19;
  const char *v20;
  double v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  id v24;
  const char *v25;
  double v26;
  NSMutableOrderedSet *v27;
  NSMutableOrderedSet *propertyKeys;
  const char *v29;
  double v30;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend_isEqualToString_(v8, v9, v10, CFSTR("subviews")))
  {
    p_subviewsValue = &self->_subviewsValue;
LABEL_5:
    objc_storeStrong(p_subviewsValue, a3);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v8, v11, v12, CFSTR("constraints")))
  {
    p_subviewsValue = &self->_constraintsValue;
    goto LABEL_5;
  }
  if (objc_msgSend_hasPrefix_(v8, v14, v15, CFSTR("view.")))
  {
    if (!v7)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    properties = self->_properties;
    if (!properties)
    {
      v19 = objc_alloc(MEMORY[0x24BDBCED8]);
      v22 = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v19, v20, v21, 8);
      v23 = self->_properties;
      self->_properties = v22;

      v24 = objc_alloc(MEMORY[0x24BDBCEE0]);
      v27 = (NSMutableOrderedSet *)objc_msgSend_initWithCapacity_(v24, v25, v26, 8);
      propertyKeys = self->_propertyKeys;
      self->_propertyKeys = v27;

      properties = self->_properties;
    }
    objc_msgSend_setObject_forKey_(properties, v16, v17, v7, v8);
    objc_msgSend_addObject_(self->_propertyKeys, v29, v30, v8);
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)TMLUITraitCollection;
    -[NSObject setTMLValue:forKeyPath:](&v31, sel_setTMLValue_forKeyPath_, v7, v8);
  }
LABEL_6:

}

- (UITraitCollection)traitCollection
{
  UITraitCollection *traitCollection;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  void *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  double displayScale;
  void *v29;
  const char *v30;
  double v31;
  UITraitCollection *v32;
  UITraitCollection *v33;

  traitCollection = self->_traitCollection;
  if (traitCollection)
    return traitCollection;
  self->_specificity = 0;
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v8 = (void *)objc_msgSend_initWithCapacity_(v4, v5, v6, 5);
  if (self->_horizontalSizeClass)
  {
    objc_msgSend_traitCollectionWithHorizontalSizeClass_(MEMORY[0x24BDF6F30], v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v11, v12, v10);

    ++self->_specificity;
  }
  if (self->_verticalSizeClass)
  {
    objc_msgSend_traitCollectionWithVerticalSizeClass_(MEMORY[0x24BDF6F30], v7, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v14, v15, v13);

    ++self->_specificity;
  }
  if (self->_userInterfaceStyle)
  {
    objc_msgSend_traitCollectionWithUserInterfaceStyle_(MEMORY[0x24BDF6F30], v7, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v17, v18, v16);

    ++self->_specificity;
  }
  if (self->_userInterfaceIdiom != -1)
  {
    objc_msgSend_traitCollectionWithUserInterfaceIdiom_(MEMORY[0x24BDF6F30], v7, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v20, v21, v19);

    ++self->_specificity;
  }
  if (self->_forceTouchCapability)
  {
    objc_msgSend_traitCollectionWithForceTouchCapability_(MEMORY[0x24BDF6F30], v7, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v23, v24, v22);

    ++self->_specificity;
  }
  if (self->_preferredContentSizeCategories)
    goto LABEL_15;
  if (self->_preferredContentSizeCategory != (NSString *)*MEMORY[0x24BDF76C0])
  {
    objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BDF6F30], v7, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v26, v27, v25);

LABEL_15:
    ++self->_specificity;
  }
  displayScale = self->_displayScale;
  if (displayScale != 0.0)
  {
    objc_msgSend_traitCollectionWithDisplayScale_(MEMORY[0x24BDF6F30], v7, displayScale);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v30, v31, v29);

    ++self->_specificity;
  }
  objc_msgSend_traitCollectionWithTraitsFromCollections_(MEMORY[0x24BDF6F30], v7, displayScale, v8);
  v32 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  v33 = self->_traitCollection;
  self->_traitCollection = v32;

  traitCollection = self->_traitCollection;
  return traitCollection;
}

- (void)applyToTraitEnvironment:(id)a3
{
  const char *v4;
  double v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  id subviewsValue;
  id constraintsValue;
  NSMutableOrderedSet *propertyKeys;
  id v13;
  id v14;
  _QWORD v15[5];

  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_view(v13, v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v13;
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:
  subviewsValue = self->_subviewsValue;
  if (subviewsValue)
    objc_msgSend_setTMLValue_forKey_(v9, v7, v8, subviewsValue, CFSTR("subviews"));
  constraintsValue = self->_constraintsValue;
  if (constraintsValue)
    objc_msgSend_setTMLValue_forKey_(v9, v7, v8, constraintsValue, CFSTR("constraints"));
  propertyKeys = self->_propertyKeys;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_22AD3A744;
  v15[3] = &unk_24F4FE4E0;
  v15[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(propertyKeys, v7, COERCE_DOUBLE(3221225472), v15, v13);

}

+ (id)traitEnvironment:(id)a3 willTransitionToTraitCollection:(id)a4 fromPreviousTraitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  id v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  id v31;
  const char *v32;
  double v33;
  uint64_t Index;
  const char *v35;
  double v36;
  void *v37;
  char isKindOfClass;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  void *v45;
  const char *v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;
  void *v51;
  BOOL v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  void *v57;
  const char *v58;
  double v59;
  id v61;
  _QWORD v62[4];
  id v63;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_tmlChildren(v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v13, v14, v15))
  {
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = sub_22AD3AA80;
    v62[3] = &unk_24F4FE598;
    v16 = v9;
    v63 = v16;
    objc_msgSend_indexesOfObjectsPassingTest_(v13, v17, v18, v62);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend_count(v19, v20, v21) < 2)
    {
      if (objc_msgSend_count(v19, v22, v23) == 1)
      {
        Index = objc_msgSend_lastIndex(v19, v32, v33);
        objc_msgSend_objectAtIndex_(v13, v35, v36, Index);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
    }
    else
    {
      objc_msgSend_objectsAtIndexes_(v13, v22, v23, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortedArrayUsingComparator_(v24, v25, v26, &unk_24F4FE5D8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastObject(v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_getAssociatedObject(v8, &unk_22AD83840);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v10 && (isKindOfClass & 1) != 0)
    {
      if (v37 == v30)
      {
        objc_msgSend_preferredContentSizeCategory(v10, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_preferredContentSizeCategory(v16, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41 == v44)
          goto LABEL_18;
      }
    }
    else if (v37 == v30)
    {
      objc_msgSend_traitCollection(v8, v39, v40);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_preferredContentSizeCategory(v45, v46, v47);
      v61 = a1;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_preferredContentSizeCategory(v16, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = v48 == v51;
      a1 = v61;
      if (v52)
        goto LABEL_18;
    }
    objc_msgSend_emitTMLSignal_withArguments_(v37, v39, v40, CFSTR("leave"), 0);
    objc_setAssociatedObject(v8, &unk_22AD83840, v30, (void *)1);
    objc_msgSend_emitTMLSignal_withArguments_(v30, v53, v54, CFSTR("willEnter"), 0);
    if (!v37 || v30)
    {
      objc_msgSend_applyToTraitEnvironment_(v30, v55, v56, v8);
      v31 = v30;
      goto LABEL_20;
    }
    objc_msgSend_defaultCollection(a1, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyToTraitEnvironment_(v57, v58, v59, v8);

LABEL_18:
    v31 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v31 = 0;
LABEL_21:

  return v31;
}

+ (id)currentTraitCollection:(id)a3
{
  return objc_getAssociatedObject(a3, &unk_22AD83840);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_userInterfaceIdiom = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (int64_t)horizontalSizeClass
{
  return self->_horizontalSizeClass;
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  self->_horizontalSizeClass = a3;
}

- (int64_t)verticalSizeClass
{
  return self->_verticalSizeClass;
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  self->_verticalSizeClass = a3;
}

- (int64_t)forceTouchCapability
{
  return self->_forceTouchCapability;
}

- (void)setForceTouchCapability:(int64_t)a3
{
  self->_forceTouchCapability = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, a3);
}

- (unint64_t)specificity
{
  return self->_specificity;
}

- (NSArray)preferredContentSizeCategories
{
  return self->_preferredContentSizeCategories;
}

- (void)setPreferredContentSizeCategories:(id)a3
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategories, a3);
}

- (NSArray)subviews
{
  return (NSArray *)self->_subviewsValue;
}

- (void)setSubviews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)constraints
{
  return (NSArray *)self->_constraintsValue;
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategories, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong(&self->_constraintsValue, 0);
  objc_storeStrong(&self->_subviewsValue, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
