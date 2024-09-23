@implementation SKUITracklistViewElement

- (void)enumerateTracksUsingBlock:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUITracklistViewElement enumerateTracksUsingBlock:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__SKUITracklistViewElement_enumerateTracksUsingBlock___block_invoke;
  v14[3] = &unk_1E73A4498;
  v13 = v4;
  v15 = v13;
  v16 = v17;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v14);

  _Block_object_dispose(v17, 8);
}

void __54__SKUITracklistViewElement_enumerateTracksUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1BCCE6C7C]();
  if (objc_msgSend(v4, "elementType") == 146)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  objc_autoreleasePoolPop(v3);

}

- (SKUIHeaderViewElement)header
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITracklistViewElement header].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__69;
  v19 = __Block_byref_object_dispose__69;
  v20 = 0;
  -[SKUITracklistViewElement children](self, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__SKUITracklistViewElement_header__block_invoke;
  v14[3] = &unk_1E73A6DE0;
  v14[4] = &v15;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (SKUIHeaderViewElement *)v12;
}

void __34__SKUITracklistViewElement_header__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 48)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (NSArray)sections
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *sections;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  NSMutableArray *v15;
  _QWORD v17[5];

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITracklistViewElement sections].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  sections = self->_sections;
  if (!sections)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = self->_sections;
    self->_sections = v12;

    -[SKUITracklistViewElement children](self, "children");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __36__SKUITracklistViewElement_sections__block_invoke;
    v17[3] = &unk_1E73A6E08;
    v17[4] = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

    sections = self->_sections;
  }
  v15 = (NSMutableArray *)-[NSMutableArray count](sections, "count");
  if (v15)
    v15 = self->_sections;
  return (NSArray *)v15;
}

void __36__SKUITracklistViewElement_sections__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 108)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "addObject:", v3);

}

- (NSArray)tracks
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *tracks;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  NSMutableArray *v15;
  _QWORD v17[5];

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITracklistViewElement tracks].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  tracks = self->_tracks;
  if (!tracks)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = self->_tracks;
    self->_tracks = v12;

    -[SKUITracklistViewElement children](self, "children");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __34__SKUITracklistViewElement_tracks__block_invoke;
    v17[3] = &unk_1E73A6E08;
    v17[4] = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

    tracks = self->_tracks;
  }
  v15 = (NSMutableArray *)-[NSMutableArray count](tracks, "count");
  if (v15)
    v15 = self->_tracks;
  return (NSArray *)v15;
}

void __34__SKUITracklistViewElement_tracks__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 146)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "addObject:", v3);

}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUITracklistViewElement *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *sections;
  NSMutableArray *tracks;
  objc_super v17;

  v4 = (SKUITracklistViewElement *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUITracklistViewElement applyUpdatesWithElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUITracklistViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v17, sel_applyUpdatesWithElement_, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != self || objc_msgSend(v13, "updateType"))
  {
    sections = self->_sections;
    self->_sections = 0;

    tracks = self->_tracks;
    self->_tracks = 0;

  }
  return v13;
}

- (int64_t)pageComponentType
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUITracklistViewElement pageComponentType].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)enumerateTracksUsingBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)header
{
  OUTLINED_FUNCTION_1();
}

- (void)sections
{
  OUTLINED_FUNCTION_1();
}

- (void)tracks
{
  OUTLINED_FUNCTION_1();
}

- (void)applyUpdatesWithElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)pageComponentType
{
  OUTLINED_FUNCTION_1();
}

@end
