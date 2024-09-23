@implementation PPLabelMatcher

- (PPLabelMatcher)init
{
  PPLabelMatcher *v2;
  PPLabelMatcher *v3;
  uint64_t v4;
  NSDictionary *map;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPLabelMatcher;
  v2 = -[PPLabelMatcher init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PPLabelMatcher _generateMap](v2, "_generateMap");
    v4 = objc_claimAutoreleasedReturnValue();
    map = v3->_map;
    v3->_map = (NSDictionary *)v4;

  }
  return v3;
}

- (unint64_t)matchFromLabel:(id)a3 toLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  unsigned int v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 1;
  if (v6 && v7)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "strong");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v8);

      if ((v13 & 1) != 0)
      {
        v9 = 2;
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "weak");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v8);

        v9 = v16;
      }
    }
    else if (objc_msgSend(v6, "caseInsensitiveCompare:", v8))
    {
      v9 = 1;
    }
    else
    {
      v9 = 2;
    }
  }

  return v9;
}

- (id)_generateMap
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1C3BD6630]();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v74 = *MEMORY[0x1E0C96FF0];
  v5 = *MEMORY[0x1E0C97000];
  v6 = *MEMORY[0x1E0C97020];
  v76 = *MEMORY[0x1E0C97058];
  v75 = *MEMORY[0x1E0C97028];
  v7 = (void *)objc_msgSend(v4, "initWithObjects:", *MEMORY[0x1E0C97000], *MEMORY[0x1E0C97020], *MEMORY[0x1E0C97058], *MEMORY[0x1E0C97028], 0);
  objc_autoreleasePoolPop(v3);
  v8 = (void *)MEMORY[0x1C3BD6630]();
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = *MEMORY[0x1E0C96FF8];
  v11 = (void *)objc_msgSend(v9, "initWithObjects:", *MEMORY[0x1E0C96FF8], 0);
  objc_autoreleasePoolPop(v8);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v10);

  v13 = (void *)MEMORY[0x1C3BD6630]();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, 0);
  objc_autoreleasePoolPop(v13);
  v15 = (void *)MEMORY[0x1C3BD6630]();
  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  v17 = *MEMORY[0x1E0C97070];
  v18 = (void *)objc_msgSend(v16, "initWithObjects:", *MEMORY[0x1E0C97070], v6, 0);
  objc_autoreleasePoolPop(v15);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, v17);

  v20 = (void *)MEMORY[0x1C3BD6630]();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v10, v17, v6, 0);
  objc_autoreleasePoolPop(v20);
  v22 = (void *)MEMORY[0x1C3BD6630]();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, 0);
  objc_autoreleasePoolPop(v22);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, v5);

  v25 = (void *)MEMORY[0x1C3BD6630]();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v10, v5, 0);
  objc_autoreleasePoolPop(v25);
  v27 = (void *)MEMORY[0x1C3BD6630]();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v74, 0);
  objc_autoreleasePoolPop(v27);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v29, v74);

  v30 = (void *)MEMORY[0x1C3BD6630]();
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, 0);
  objc_autoreleasePoolPop(v30);
  v32 = (void *)MEMORY[0x1C3BD6630]();
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, v17, 0);
  objc_autoreleasePoolPop(v32);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v34, v6);

  v35 = (void *)MEMORY[0x1C3BD6630]();
  v36 = objc_alloc(MEMORY[0x1E0C99E60]);
  v37 = *MEMORY[0x1E0C97038];
  v38 = (void *)objc_msgSend(v36, "initWithObjects:", *MEMORY[0x1E0C97038], 0);
  objc_autoreleasePoolPop(v35);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", 0, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v39, v37);

  v40 = (void *)MEMORY[0x1C3BD6630]();
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v10, v5, v6, 0);
  objc_autoreleasePoolPop(v40);
  v42 = (void *)MEMORY[0x1C3BD6630]();
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v76, v75, 0);
  objc_autoreleasePoolPop(v42);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", v41, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v44, v76);

  v45 = (void *)MEMORY[0x1C3BD6630]();
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v10, v5, v6, 0);
  objc_autoreleasePoolPop(v45);
  v47 = (void *)MEMORY[0x1C3BD6630]();
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v76, v75, 0);
  objc_autoreleasePoolPop(v47);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", v46, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v49, v75);

  v50 = (void *)MEMORY[0x1C3BD6630]();
  v51 = objc_alloc(MEMORY[0x1E0C99E60]);
  v52 = *MEMORY[0x1E0C97010];
  v53 = *MEMORY[0x1E0C97030];
  v54 = *MEMORY[0x1E0C97050];
  v55 = (void *)objc_msgSend(v51, "initWithObjects:", *MEMORY[0x1E0C97010], *MEMORY[0x1E0C97030], *MEMORY[0x1E0C97050], 0);
  objc_autoreleasePoolPop(v50);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", 0, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v56, v52);

  v57 = (void *)MEMORY[0x1C3BD6630]();
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v52, v53, v54, 0);
  objc_autoreleasePoolPop(v57);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", 0, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v59, v54);

  v60 = (void *)MEMORY[0x1C3BD6630]();
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v52, v53, v54, 0);
  objc_autoreleasePoolPop(v60);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", 0, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v62, v53);

  v63 = (void *)MEMORY[0x1C3BD6630]();
  v64 = objc_alloc(MEMORY[0x1E0C99E60]);
  v65 = *MEMORY[0x1E0C97068];
  v66 = (void *)objc_msgSend(v64, "initWithObjects:", *MEMORY[0x1E0C97068], 0);
  objc_autoreleasePoolPop(v63);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", 0, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v67, v65);

  v68 = (void *)MEMORY[0x1C3BD6630]();
  v69 = objc_alloc(MEMORY[0x1E0C99E60]);
  v70 = *MEMORY[0x1E0C96FE8];
  v71 = (void *)objc_msgSend(v69, "initWithObjects:", *MEMORY[0x1E0C96FE8], 0);
  objc_autoreleasePoolPop(v68);
  +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:strongSet:](PPLabelStrengthSets, "labelStrengthSetsWithWeakSet:strongSet:", 0, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v72, v70);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_once_22978 != -1)
    dispatch_once(&sharedInstance_once_22978, &__block_literal_global_22979);
  return (id)sharedInstance_shared_22980;
}

void __32__PPLabelMatcher_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_22980;
  sharedInstance_shared_22980 = v0;

}

@end
