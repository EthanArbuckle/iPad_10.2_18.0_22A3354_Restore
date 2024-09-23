@implementation SiriUIComponentConstraintFactory

+ (id)sharedConstraintFactory
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SiriUIComponentConstraintFactory_sharedConstraintFactory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConstraintFactory_onceToken != -1)
    dispatch_once(&sharedConstraintFactory_onceToken, block);
  return (id)s_sharedConstraintFactory;
}

void __59__SiriUIComponentConstraintFactory_sharedConstraintFactory__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)s_sharedConstraintFactory;
  s_sharedConstraintFactory = (uint64_t)v0;

}

- (SiriUIComponentConstraintFactory)init
{
  SiriUIComponentConstraintFactory *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIComponentConstraintFactory;
  v2 = -[SiriUIComponentConstraintFactory init](&v4, sel_init);
  -[SiriUIComponentConstraintFactory _setupMaps](v2, "_setupMaps");
  return v2;
}

- (void)_setupMaps
{
  NSMutableDictionary *v3;
  NSMutableDictionary *layoutStyleToComponentLayoutMaps;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  void *v29;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[6];
  _QWORD v38[6];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[6];
  _QWORD v52[8];

  v52[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  layoutStyleToComponentLayoutMaps = self->_layoutStyleToComponentLayoutMaps;
  self->_layoutStyleToComponentLayoutMaps = v3;

  -[SiriUIComponentConstraintFactory _createMapForLayoutStyle:](self, "_createMapForLayoutStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _createMapForLayoutStyle:](self, "_createMapForLayoutStyle:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _createMapForLayoutStyle:](self, "_createMapForLayoutStyle:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = &unk_24D7EF340;
  v51[1] = &unk_24D7EF358;
  v52[0] = &unk_24D7EF5A0;
  v52[1] = &unk_24D7EF5B0;
  v51[2] = &unk_24D7EF370;
  v51[3] = &unk_24D7EF388;
  v52[2] = &unk_24D7EF5C0;
  v52[3] = &unk_24D7EF5C0;
  v51[4] = &unk_24D7EF3A0;
  v51[5] = &unk_24D7EF3B8;
  v52[4] = &unk_24D7EF5B0;
  v52[5] = &unk_24D7EF5D0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v6, 1, v5);
  v49[0] = &unk_24D7EF340;
  v49[1] = &unk_24D7EF3B8;
  v50[0] = &unk_24D7EF5E0;
  v50[1] = &unk_24D7EF5F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v7, 1, v21);
  v47[0] = &unk_24D7EF340;
  v47[1] = &unk_24D7EF3B8;
  v48[0] = &unk_24D7EF5E0;
  v48[1] = &unk_24D7EF600;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v20, 1, v22);
  v45[0] = &unk_24D7EF340;
  v45[1] = &unk_24D7EF358;
  v46[0] = &unk_24D7EF610;
  v46[1] = &unk_24D7EF5B0;
  v45[2] = &unk_24D7EF3B8;
  v46[2] = &unk_24D7EF620;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v19, 0, v5);
  v43[0] = &unk_24D7EF340;
  v43[1] = &unk_24D7EF358;
  v44[0] = &unk_24D7EF5B0;
  v44[1] = &unk_24D7EF620;
  v43[2] = &unk_24D7EF388;
  v43[3] = &unk_24D7EF3B8;
  v44[2] = &unk_24D7EF5D0;
  v44[3] = &unk_24D7EF5F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v8, 3, v5);
  v41[0] = &unk_24D7EF358;
  v41[1] = &unk_24D7EF388;
  v42[0] = &unk_24D7EF5D0;
  v42[1] = &unk_24D7EF630;
  v41[2] = &unk_24D7EF3A0;
  v41[3] = &unk_24D7EF3B8;
  v42[2] = &unk_24D7EF5B0;
  v42[3] = &unk_24D7EF5F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v9, 3, v21);
  v39[0] = &unk_24D7EF358;
  v39[1] = &unk_24D7EF388;
  v40[0] = &unk_24D7EF5D0;
  v40[1] = &unk_24D7EF630;
  v39[2] = &unk_24D7EF3A0;
  v39[3] = &unk_24D7EF3B8;
  v40[2] = &unk_24D7EF5B0;
  v40[3] = &unk_24D7EF600;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v18, 3, v22);
  v37[0] = &unk_24D7EF340;
  v37[1] = &unk_24D7EF358;
  v38[0] = &unk_24D7EF640;
  v38[1] = &unk_24D7EF650;
  v37[2] = &unk_24D7EF370;
  v37[3] = &unk_24D7EF388;
  v38[2] = &unk_24D7EF620;
  v38[3] = &unk_24D7EF5D0;
  v37[4] = &unk_24D7EF3A0;
  v37[5] = &unk_24D7EF3B8;
  v38[4] = &unk_24D7EF5B0;
  v38[5] = &unk_24D7EF660;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v10, 2, v5);
  v35[0] = &unk_24D7EF358;
  v35[1] = &unk_24D7EF388;
  v36[0] = &unk_24D7EF5B0;
  v36[1] = &unk_24D7EF630;
  v35[2] = &unk_24D7EF3B8;
  v36[2] = &unk_24D7EF600;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v17, 2, v21);
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v17, 2, v22);
  v33[0] = &unk_24D7EF358;
  v33[1] = &unk_24D7EF370;
  v34[0] = &unk_24D7EF650;
  v34[1] = &unk_24D7EF620;
  v33[2] = &unk_24D7EF388;
  v33[3] = &unk_24D7EF3B8;
  v34[2] = &unk_24D7EF5D0;
  v34[3] = &unk_24D7EF5F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v16, 4, v5);
  v31[0] = &unk_24D7EF340;
  v31[1] = &unk_24D7EF358;
  v32[0] = &unk_24D7EF610;
  v32[1] = &unk_24D7EF670;
  v31[2] = &unk_24D7EF370;
  v31[3] = &unk_24D7EF3B8;
  v32[2] = &unk_24D7EF670;
  v32[3] = &unk_24D7EF620;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v11, 5, v5);
  v29 = &unk_24D7EF3B8;
  v30 = &unk_24D7EF5E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v12, 5, v21);
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v12, 5, v22);
  v27[0] = &unk_24D7EF340;
  v27[1] = &unk_24D7EF3B8;
  v28[0] = &unk_24D7EF5F0;
  v28[1] = &unk_24D7EF600;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v13, 8, v5);
  v25 = &unk_24D7EF340;
  v26 = &unk_24D7EF600;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v14, 8, v22);
  v23[0] = &unk_24D7EF340;
  v23[1] = &unk_24D7EF3B8;
  v24[0] = &unk_24D7EF5A0;
  v24[1] = &unk_24D7EF5D0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIComponentConstraintFactory _addConstants:forLowerComponentStyle:toMap:](self, "_addConstants:forLowerComponentStyle:toMap:", v15, 9, v5);

}

- (id)verticalConstraintFromUpperView:(id)a3 lowerView:(id)a4 upperTemplateComponent:(id)a5 lowerTemplateComponent:(id)a6 layoutStyle:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  float v22;
  void *v23;
  int v25;
  const char *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = -[SiriUIComponentConstraintFactory _componentTypeForView:component:](self, "_componentTypeForView:component:", v12, a5);
  v16 = -[SiriUIComponentConstraintFactory _componentTypeForView:component:](self, "_componentTypeForView:component:", v13, v14);

  v17 = -[SiriUIComponentConstraintFactory _layoutAttributeForView:componentType:isLower:](self, "_layoutAttributeForView:componentType:isLower:", v12, v15, 0);
  v18 = -[SiriUIComponentConstraintFactory _layoutAttributeForView:componentType:isLower:](self, "_layoutAttributeForView:componentType:isLower:", v13, v16, 1);
  -[SiriUIComponentConstraintFactory _bestDistanceFromComponentType:toComponentType:layoutStyle:](self, "_bestDistanceFromComponentType:toComponentType:layoutStyle:", v15, v16, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    goto LABEL_5;
  v20 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v25 = 136315906;
    v26 = "-[SiriUIComponentConstraintFactory verticalConstraintFromUpperView:lowerView:upperTemplateComponent:lowerTempl"
          "ateComponent:layoutStyle:]";
    v27 = 2048;
    v28 = v15;
    v29 = 2048;
    v30 = v16;
    v31 = 2048;
    v32 = a7;
    _os_log_error_impl(&dword_21764F000, v20, OS_LOG_TYPE_ERROR, "%s No template distance found for component type %zd to %zd (layoutStyle %zd)", (uint8_t *)&v25, 0x2Au);
  }
  -[SiriUIComponentConstraintFactory _bestDistanceFromComponentType:toComponentType:layoutStyle:](self, "_bestDistanceFromComponentType:toComponentType:layoutStyle:", 1, v16, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
LABEL_5:
    v21 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v19, "floatValue");
    objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, v18, 0, v12, v17, 1.0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 3, 0, v12, 4, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)topConstraintForView:(id)a3 inSuperview:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6
{
  id v10;
  id v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = -[SiriUIComponentConstraintFactory _componentTypeForView:component:](self, "_componentTypeForView:component:", v10, a5);
  v13 = -[SiriUIComponentConstraintFactory _layoutAttributeForView:componentType:isLower:](self, "_layoutAttributeForView:componentType:isLower:", v10, 6, 1);
  -[SiriUIComponentConstraintFactory _bestDistanceFromComponentType:toComponentType:layoutStyle:](self, "_bestDistanceFromComponentType:toComponentType:layoutStyle:", 6, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, v13, 0, v11, 3, 1.0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)bottomConstraintForView:(id)a3 inSuperview:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6
{
  id v10;
  id v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = -[SiriUIComponentConstraintFactory _componentTypeForView:component:](self, "_componentTypeForView:component:", v10, a5);
  v13 = -[SiriUIComponentConstraintFactory _layoutAttributeForView:componentType:isLower:](self, "_layoutAttributeForView:componentType:isLower:", v10, v12, 0);
  -[SiriUIComponentConstraintFactory _bestDistanceFromComponentType:toComponentType:layoutStyle:](self, "_bestDistanceFromComponentType:toComponentType:layoutStyle:", 7, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 4, 1, v10, v13, 1.0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)topConstraintForView:(id)a3 fromLayoutGuide:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6
{
  id v10;
  id v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = -[SiriUIComponentConstraintFactory _componentTypeForView:component:](self, "_componentTypeForView:component:", v10, a5);
  v13 = -[SiriUIComponentConstraintFactory _layoutAttributeForView:componentType:isLower:](self, "_layoutAttributeForView:componentType:isLower:", v10, 6, 1);
  -[SiriUIComponentConstraintFactory _bestDistanceFromComponentType:toComponentType:layoutStyle:](self, "_bestDistanceFromComponentType:toComponentType:layoutStyle:", 6, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, v13, 0, v11, 3, 1.0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)bottomConstraintForView:(id)a3 fromLayoutGuide:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6
{
  id v10;
  id v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = -[SiriUIComponentConstraintFactory _componentTypeForView:component:](self, "_componentTypeForView:component:", v10, a5);
  v13 = -[SiriUIComponentConstraintFactory _layoutAttributeForView:componentType:isLower:](self, "_layoutAttributeForView:componentType:isLower:", v10, v12, 0);
  -[SiriUIComponentConstraintFactory _bestDistanceFromComponentType:toComponentType:layoutStyle:](self, "_bestDistanceFromComponentType:toComponentType:layoutStyle:", 7, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 4, 1, v10, v13, 1.0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_bestDistanceFromComponentType:(unint64_t)a3 toComponentType:(unint64_t)a4 layoutStyle:(int64_t)a5
{
  NSMutableDictionary *layoutStyleToComponentLayoutMaps;
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
  NSObject *v19;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  layoutStyleToComponentLayoutMaps = self->_layoutStyleToComponentLayoutMaps;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](layoutStyleToComponentLayoutMaps, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_layoutStyleToComponentLayoutMaps, "objectForKeyedSubscript:", &unk_24D7EF3D0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v19 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v23 = "-[SiriUIComponentConstraintFactory _bestDistanceFromComponentType:toComponentType:layoutStyle:]";
        v24 = 2048;
        v25 = a3;
        v26 = 2048;
        v27 = a4;
        v28 = 2048;
        v29 = a5;
        _os_log_impl(&dword_21764F000, v19, OS_LOG_TYPE_DEFAULT, "%s Template component distance is not specified between types %zd and %zd for layoutStyle: %zd", buf, 0x2Au);
      }
      v14 = 0;
    }
  }
  return v14;
}

- (unint64_t)_componentTypeForView:(id)a3 component:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 9;
    else
      v7 = objc_msgSend(v6, "style");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = 8;
    else
      v7 = -1;
  }

  return v7;
}

- (int64_t)_layoutAttributeForView:(id)a3 componentType:(unint64_t)a4 isLower:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  uint64_t v15;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "viewForFirstBaselineLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "viewForLastBaselineLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 12;
  if (!v8)
    v10 = 3;
  if (!v5)
    v10 = 3;
  v11 = 11;
  if (!v9)
    v11 = 4;
  v12 = 12;
  if (!v8)
    v12 = 3;
  if (v5)
    v11 = v12;
  if (v9)
    v13 = v5;
  else
    v13 = 1;
  v14 = v13 == 0;
  v15 = 11;
  if (!v14)
    v15 = 4;
  if (a4 == 7)
    v11 = v15;
  if (a4 == 6)
    return v10;
  else
    return v11;
}

- (id)_createMapForLayoutStyle:(int64_t)a3
{
  NSMutableDictionary *layoutStyleToComponentLayoutMaps;
  void *v6;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;

  layoutStyleToComponentLayoutMaps = self->_layoutStyleToComponentLayoutMaps;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](layoutStyleToComponentLayoutMaps, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = self->_layoutStyleToComponentLayoutMaps;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v11 = self->_layoutStyleToComponentLayoutMaps;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_addConstants:(id)a3 forLowerComponentStyle:(unint64_t)a4 toMap:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutStyleToComponentLayoutMaps, 0);
}

@end
