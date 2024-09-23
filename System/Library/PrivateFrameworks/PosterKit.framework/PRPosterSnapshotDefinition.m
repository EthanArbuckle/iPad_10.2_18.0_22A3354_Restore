@implementation PRPosterSnapshotDefinition

- (PRPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 includeHeaderElements:(BOOL)a4 includesComplications:(BOOL)a5 levelSets:(id)a6 isUnlocked:(BOOL)a7 renderingContent:(int64_t)a8 renderingMode:(int64_t)a9 previewContent:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  PRPosterSnapshotDefinition *v21;
  PRPosterSnapshotDefinition *v22;
  uint64_t v23;
  NSArray *levelSets;
  uint64_t v25;
  NSString *uniqueIdentifier;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v17 = a3;
  v18 = a6;
  v19 = v17;
  NSClassFromString(CFSTR("NSString"));
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:].cold.1();
LABEL_23:
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6A72A4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:].cold.1();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6A7300);
  }

  v20 = v18;
  NSClassFromString(CFSTR("NSArray"));
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6A735CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:].cold.2();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6A73B8);
  }

  if (!objc_msgSend(v20, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[levelSets count] > 0"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:].cold.3(a2, (uint64_t)self, (uint64_t)v28);
    goto LABEL_23;
  }
  v32.receiver = self;
  v32.super_class = (Class)PRPosterSnapshotDefinition;
  v21 = -[PRPosterSnapshotDefinition init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_includesHeaderElements = a4;
    v21->_includesComplications = a5;
    v23 = objc_msgSend(v20, "copy");
    levelSets = v22->_levelSets;
    v22->_levelSets = (NSArray *)v23;

    v22->_layerSet = PRPosterSnapshotDefinitionLayerSetForPRPosterLevelSets(v20);
    v22->_unlocked = a7;
    v22->_renderingContent = a8;
    v22->_renderingMode = a9;
    v22->_previewContent = a10;
    v25 = objc_msgSend(v19, "copy");
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v25;

  }
  return v22;
}

- (PRPosterSnapshotDefinition)initWithUniqueIdentifier:(id)a3 includeHeaderElements:(BOOL)a4 includesComplications:(BOOL)a5 layerSet:(unint64_t)a6 isUnlocked:(BOOL)a7 renderingContent:(int64_t)a8 renderingMode:(int64_t)a9 previewContent:(unint64_t)a10
{
  _BOOL8 v11;
  _BOOL8 v13;
  _BOOL8 v14;
  id v16;
  void *v17;
  PRPosterSnapshotDefinition *v18;

  v11 = a7;
  v13 = a5;
  v14 = a4;
  v16 = a3;
  PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet(a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:](self, "initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:", v16, v14, v13, v17, v11, a8, a9, a10);

  if (v18)
    v18->_layerSet = a6;
  return v18;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_includesHeaderElements);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_includesComplications);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_levelSets);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_unlocked);
  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_renderingContent);
  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_renderingMode);
  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_previewContent);
  v11 = objc_msgSend(v3, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterSnapshotDefinition *v4;
  BOOL v5;

  v4 = (PRPosterSnapshotDefinition *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PRPosterSnapshotDefinition isEqualToDefinition:](self, "isEqualToDefinition:", v4);
  }

  return v5;
}

- (BOOL)isEqualToDefinition:(id)a3
{
  PRPosterSnapshotDefinition *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  PRPosterSnapshotDefinition *v8;
  id v9;
  void *v10;
  PRPosterSnapshotDefinition *v11;
  id v12;
  _BOOL8 v13;
  PRPosterSnapshotDefinition *v14;
  id v15;
  void *v16;
  PRPosterSnapshotDefinition *v17;
  id v18;
  int64_t v19;
  PRPosterSnapshotDefinition *v20;
  id v21;
  int64_t v22;
  PRPosterSnapshotDefinition *v23;
  id v24;
  unint64_t v25;
  id v26;
  char v27;
  _QWORD v29[4];
  PRPosterSnapshotDefinition *v30;
  _QWORD v31[4];
  PRPosterSnapshotDefinition *v32;
  _QWORD v33[4];
  PRPosterSnapshotDefinition *v34;
  _QWORD v35[4];
  PRPosterSnapshotDefinition *v36;
  _QWORD v37[4];
  PRPosterSnapshotDefinition *v38;
  _QWORD v39[4];
  PRPosterSnapshotDefinition *v40;
  _QWORD v41[4];
  PRPosterSnapshotDefinition *v42;

  v4 = (PRPosterSnapshotDefinition *)a3;
  if (self == v4)
  {
    v27 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PRPosterSnapshotDefinition includesHeaderElements](self, "includesHeaderElements");
    v7 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke;
    v41[3] = &unk_1E2184138;
    v8 = v4;
    v42 = v8;
    v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v41);
    -[PRPosterSnapshotDefinition levelSets](self, "levelSets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_2;
    v39[3] = &unk_1E2185468;
    v11 = v8;
    v40 = v11;
    v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v39);

    v13 = -[PRPosterSnapshotDefinition isUnlocked](self, "isUnlocked");
    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_3;
    v37[3] = &unk_1E2184138;
    v14 = v11;
    v38 = v14;
    v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v37);
    -[PRPosterSnapshotDefinition uniqueIdentifier](self, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_4;
    v35[3] = &unk_1E2184110;
    v17 = v14;
    v36 = v17;
    v18 = (id)objc_msgSend(v5, "appendString:counterpart:", v16, v35);

    v19 = -[PRPosterSnapshotDefinition renderingContent](self, "renderingContent");
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_5;
    v33[3] = &unk_1E2184188;
    v20 = v17;
    v34 = v20;
    v21 = (id)objc_msgSend(v5, "appendInt64:counterpart:", v19, v33);
    v22 = -[PRPosterSnapshotDefinition renderingMode](self, "renderingMode");
    v31[0] = v7;
    v31[1] = 3221225472;
    v31[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_6;
    v31[3] = &unk_1E2184188;
    v23 = v20;
    v32 = v23;
    v24 = (id)objc_msgSend(v5, "appendInt64:counterpart:", v22, v31);
    v25 = -[PRPosterSnapshotDefinition previewContent](self, "previewContent");
    v29[0] = v7;
    v29[1] = 3221225472;
    v29[2] = __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_7;
    v29[3] = &unk_1E2184188;
    v30 = v23;
    v26 = (id)objc_msgSend(v5, "appendInt64:counterpart:", v25, v29);
    v27 = objc_msgSend(v5, "isEqual");

  }
  return v27;
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "includesHeaderElements");
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "levelSets");
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isUnlocked");
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderingContent");
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderingMode");
}

uint64_t __50__PRPosterSnapshotDefinition_isEqualToDefinition___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previewContent");
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_includesHeaderElements, CFSTR("includesHeaderElements"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_includesComplications, CFSTR("includesComplications"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_unlocked, CFSTR("isUnlocked"));
  NSStringFromPRRenderingContent(self->_renderingContent);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("renderingContent"));

  NSStringFromPRRenderingMode(self->_renderingMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("renderingMode"));

  NSStringFromPRPosterPreviewContent(self->_previewContent);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("previewContent"));

  v11 = (id)objc_msgSend(v3, "appendObject:withName:", self->_levelSets, CFSTR("levelSets"));
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)applySceneSettings:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL8 v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  double v10;
  id v11;

  v4 = a3;
  -[PRPosterSnapshotDefinition uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PRPosterSnapshotDefinition includesHeaderElements](self, "includesHeaderElements");
  v6 = -[PRPosterSnapshotDefinition includesComplications](self, "includesComplications");
  v7 = -[PRPosterSnapshotDefinition renderingContent](self, "renderingContent");
  v8 = -[PRPosterSnapshotDefinition renderingMode](self, "renderingMode");
  v9 = -[PRPosterSnapshotDefinition previewContent](self, "previewContent");
  if (-[PRPosterSnapshotDefinition isUnlocked](self, "isUnlocked"))
    v10 = 1.0;
  else
    v10 = 0.0;
  objc_msgSend(v4, "pui_setContent:", v7);
  objc_msgSend(v4, "pui_setMode:", v8);
  objc_msgSend(v4, "pui_setPreviewContent:", v9);
  objc_msgSend(v4, "pui_setPreviewIdentifier:", v11);
  objc_msgSend(v4, "pr_setUnlockProgress:", v10);
  objc_msgSend(v4, "pui_setShowsComplications:", v6);
  objc_msgSend(v4, "pui_setShowsHeaderElements:", v5);

}

+ (int64_t)snapshotOptionsForDefinition:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  v3 = a3;
  if (objc_msgSend(v3, "includesHeaderElements"))
    v4 = 2;
  else
    v4 = 0;
  if (objc_msgSend(v3, "includesComplications"))
    v4 |= 4uLL;
  v5 = objc_msgSend(v3, "layerSet");
  v6 = v4 | 0x20;
  v7 = v4 | 0x38;
  if (v5)
    v7 = v4;
  if (v5 != 1)
    v6 = v7;
  if (v5 == 2)
    v8 = v4 | 0x18;
  else
    v8 = v6;
  if (objc_msgSend(v3, "isUnlocked"))
    v8 |= 0x40uLL;
  if (PRRenderingContentIsPreview(objc_msgSend(v3, "renderingContent")))
    v8 |= 0x80uLL;

  return v8;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)includesHeaderElements
{
  return self->_includesHeaderElements;
}

- (BOOL)includesComplications
{
  return self->_includesComplications;
}

- (int64_t)renderingContent
{
  return self->_renderingContent;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (unint64_t)previewContent
{
  return self->_previewContent;
}

- (NSArray)levelSets
{
  return self->_levelSets;
}

- (BOOL)isUnlocked
{
  return self->_unlocked;
}

- (unint64_t)layerSet
{
  return self->_layerSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelSets, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PRPosterSnapshotDefinition initWithUniqueIdentifier:includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithUniqueIdentifier:(uint64_t)a3 includeHeaderElements:includesComplications:levelSets:isUnlocked:renderingContent:renderingMode:previewContent:.cold.3(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PRPosterSnapshotDefinition.m");
  v16 = 1024;
  v17 = 55;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
