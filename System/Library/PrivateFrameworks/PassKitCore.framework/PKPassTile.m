@implementation PKPassTile

+ (id)createTileRowsForTiles:(id)a3 forceCompact:(BOOL)a4 maximumColumns:(unint64_t)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  id v24;
  uint64_t aBlock;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v6 = a4;
  v7 = a3;
  v8 = 0;
  if (v7 && a5)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__33;
    v37 = __Block_byref_object_dispose__33;
    v38 = 0;
    aBlock = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __65__PKPassTile_createTileRowsForTiles_forceCompact_maximumColumns___block_invoke;
    v28 = &unk_1E2ACE368;
    v30 = &v33;
    v32 = v6;
    v24 = v9;
    v29 = v24;
    v31 = &v39;
    v10 = (void (**)(_QWORD))_Block_copy(&aBlock);
    if (v6)
      objc_msgSend(v7, "reverseObjectEnumerator");
    else
      objc_msgSend(v7, "objectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; i = v13)
    {
      objc_msgSend(v11, "nextObject", v24, aBlock, v26, v27, v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v10[2](v10);
        v8 = (void *)objc_msgSend(v24, "copy");

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v39, 8);

        goto LABEL_27;
      }
      objc_msgSend(v13, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stateTypeDefaultV2");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_9;
      objc_msgSend(v13, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "preferredStyle"))
        break;
      if (!v15)
      {

LABEL_9:
        v16 = 0;
        goto LABEL_17;
      }
      v18 = objc_msgSend(v15, "preferredStyle");

      v16 = 0;
      if (v18 <= 4 && ((1 << v18) & 0x15) != 0)
        goto LABEL_16;
LABEL_17:
      v19 = (void *)v34[5];
      if (v19)
      {
        if (v6)
          goto LABEL_19;
      }
      else
      {
        v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v21 = (void *)v34[5];
        v34[5] = (uint64_t)v20;

        v19 = (void *)v34[5];
        if (v6)
        {
LABEL_19:
          objc_msgSend(v19, "insertObject:atIndex:", v13, 0);
          goto LABEL_22;
        }
      }
      objc_msgSend(v19, "addObject:", v13);
LABEL_22:
      v22 = v40[3] + 1;
      v40[3] = v22;
      if (((v22 < a5) & ~v16) == 0)
        v10[2](v10);

    }
LABEL_16:
    v10[2](v10);
    v16 = 1;
    goto LABEL_17;
  }
LABEL_27:

  return v8;
}

void __65__PKPassTile_createTileRowsForTiles_forceCompact_maximumColumns___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_msgSend(v2, "copy");
    if (v3)
      objc_msgSend(v4, "insertObject:atIndex:", v5, 0);
    else
      objc_msgSend(v4, "addObject:", v5);

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (PKPassTile)init
{

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassTile;
  return -[PKPassTile init](&v3, sel_init);
}

- (id)_initWithMetadata:(id)a3 childTiles:(id)a4 stateIdentifier:(id)a5 state:(id)a6 inProgress:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PKPassTile *v17;
  id *v18;
  id *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  v17 = 0;
  if (v12 && v15)
  {
    if (objc_msgSend(v15, "isResolved"))
    {
      v18 = -[PKPassTile _init](self, "_init");
      v19 = v18;
      if (v18)
      {
        objc_storeStrong(v18 + 2, a3);
        objc_storeStrong(v19 + 5, a4);
        objc_storeStrong(v19 + 3, a5);
        objc_storeStrong(v19 + 4, a6);
        *((_BYTE *)v19 + 8) = a7;
      }
      self = v19;
      v17 = self;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (BOOL)isGroupTile
{
  return -[PKPassTileMetadata isGroupType](self->_metadata, "isGroupType");
}

- (id)prearmTiles
{
  void *v2;
  void *v3;
  id v4;

  -[NSArray pk_objectsPassingTest:](self->_tiles, "pk_objectsPassingTest:", &__block_literal_global_104);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __25__PKPassTile_prearmTiles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showInPrearm");

  return v3;
}

- (id)maximumRows
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[PKPassTile metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "type") != 2)
  {
    if (objc_msgSend(v2, "type") != 3)
    {
      v5 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v2, "metadataTypeVerticalFlowGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "rows");
    if (v4)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v2, "metadataTypeHorizontalFlowGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maximumRows");
  if (!v4)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_9:
  return v5;
}

+ (id)_createDefaultDashboardGroupTileWithChildTiles:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = +[PKPassTileMetadataHorizontalFlowGroup _createDefaultDashboardGroupMetadata](PKPassTileMetadataHorizontalFlowGroup, "_createDefaultDashboardGroupMetadata");
  v5 = +[PKPassTileStateGroup _createDefaultDashboardGroupStateWithMetadata:](PKPassTileStateGroup, "_createDefaultDashboardGroupStateWithMetadata:", v4);
  v6 = -[PKPassTile _initWithMetadata:childTiles:stateIdentifier:state:inProgress:]([PKPassTile alloc], "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v4, v3, CFSTR("default"), v5, 0);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTile)initWithCoder:(id)a3
{
  id v4;
  PKPassTile *v5;
  uint64_t v6;
  PKPassTileMetadata *metadata;
  uint64_t v8;
  NSArray *tiles;
  uint64_t v10;
  NSString *stateIdentifier;
  uint64_t v12;
  PKPassTileState *state;

  v4 = a3;
  v5 = -[PKPassTile _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (PKPassTileMetadata *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("tiles"));
    v8 = objc_claimAutoreleasedReturnValue();
    tiles = v5->_tiles;
    v5->_tiles = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    stateIdentifier = v5->_stateIdentifier;
    v5->_stateIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v12 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (PKPassTileState *)v12;

    v5->_inProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inProgress"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPassTileMetadata *metadata;
  id v5;

  metadata = self->_metadata;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", metadata, CFSTR("metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tiles, CFSTR("tiles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateIdentifier, CFSTR("stateIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_inProgress, CFSTR("inProgress"));

}

- (BOOL)supportsPaymentPassAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "isActionAvailable"))
    goto LABEL_10;
  v6 = objc_msgSend(v5, "type");
  if ((unint64_t)(v6 - 7) < 3)
  {
    v7 = 1;
    goto LABEL_11;
  }
  if (v6 != 4)
  {
    v7 = v6 == 3;
    goto LABEL_11;
  }
  if (-[PKPassTileMetadata type](self->_metadata, "type") != 1)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  -[PKPassTileMetadata metadataTypeVehicleFunction](self->_metadata, "metadataTypeVehicleFunction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vehicleFunctions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v5, "vehicleFunctionActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

LABEL_11:
  return v7;
}

- (PKPassTileMetadata)metadata
{
  return self->_metadata;
}

- (NSString)stateIdentifier
{
  return self->_stateIdentifier;
}

- (PKPassTileState)state
{
  return self->_state;
}

- (BOOL)isInProgress
{
  return self->_inProgress;
}

- (NSArray)tiles
{
  return self->_tiles;
}

- (void)setTiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_axID, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_stateIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
