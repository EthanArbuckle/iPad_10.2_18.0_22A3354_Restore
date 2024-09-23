@implementation RESectionDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setName:", self->_name);
  objc_msgSend(v4, "setMaxElementCount:", self->_maxElementCount);
  objc_storeStrong(v4 + 1, self->_rules);
  v5 = (void *)-[REHistoricSectionDescriptor copy](self->_historicSectionDescriptor, "copy");
  objc_msgSend(v4, "setHistoricSectionDescriptor:", v5);

  return v4;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RESectionDescriptor)init
{
  RESectionDescriptor *v2;
  RESectionDescriptor *v3;
  NSString *name;
  uint64_t v5;
  NSOrderedSet *rules;
  REHistoricSectionDescriptor *historicSectionDescriptor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RESectionDescriptor;
  v2 = -[RESectionDescriptor init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxElementCount = -1;
    name = v2->_name;
    v2->_name = (NSString *)&stru_24CF92178;

    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
    v5 = objc_claimAutoreleasedReturnValue();
    rules = v3->_rules;
    v3->_rules = (NSOrderedSet *)v5;

    historicSectionDescriptor = v3->_historicSectionDescriptor;
    v3->_historicSectionDescriptor = 0;

  }
  return v3;
}

- (void)setMaxElementCount:(int64_t)a3
{
  self->_maxElementCount = a3;
}

- (void)setHistoricSectionDescriptor:(id)a3
{
  REHistoricSectionDescriptor *v4;
  REHistoricSectionDescriptor *historicSectionDescriptor;
  REHistoricSectionDescriptor *v6;

  v4 = (REHistoricSectionDescriptor *)objc_msgSend(a3, "copy");
  -[REHistoricSectionDescriptor setParentDescriptor:](self->_historicSectionDescriptor, "setParentDescriptor:", 0);
  historicSectionDescriptor = self->_historicSectionDescriptor;
  self->_historicSectionDescriptor = v4;
  v6 = v4;

  -[REHistoricSectionDescriptor setParentDescriptor:](self->_historicSectionDescriptor, "setParentDescriptor:", self);
}

- (NSArray)orderedRules
{
  return -[NSOrderedSet array](self->_rules, "array");
}

- (int64_t)maxElementCount
{
  return self->_maxElementCount;
}

- (REHistoricSectionDescriptor)historicSectionDescriptor
{
  return self->_historicSectionDescriptor;
}

- (void)setRules:(id)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *rules;

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithSet:", a3);
  v4 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  rules = self->_rules;
  self->_rules = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicSectionDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

- (NSSet)rules
{
  void *v2;
  void *v3;

  -[NSOrderedSet set](self->_rules, "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

+ (id)defaultSectionDescriptorForIdentifier:(id)a3
{
  id v3;
  void (**v4)(_QWORD);
  RESectionDescriptor *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __61__RESectionDescriptor_defaultSectionDescriptorForIdentifier___block_invoke_3;
  v11 = &unk_24CF8D538;
  v12 = &__block_literal_global_29;
  v13 = &__block_literal_global_75;
  v3 = a3;
  v4 = (void (**)(_QWORD))MEMORY[0x2199B2434](&v8);
  v5 = objc_alloc_init(RESectionDescriptor);
  v4[2](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RESectionDescriptor setOrderedRules:](v5, "setOrderedRules:", v6, v8, v9, v10, v11);

  -[RESectionDescriptor setName:](v5, "setName:", v3);
  return v5;
}

- (void)setOrderedRules:(id)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *rules;

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", a3);
  v4 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  rules = self->_rules;
  self->_rules = v4;

}

REFilteringRule *__61__RESectionDescriptor_defaultSectionDescriptorForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  REFilteringRule *v13;
  void *v14;
  REFilteringRule *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v8, -1, 3.18618444e-58);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v9;
        v22[1] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[RECondition andConditions:](RECondition, "andConditions:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v12);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v13 = [REFilteringRule alloc];
  +[RECondition orConditions:](RECondition, "orConditions:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[REFilteringRule initWithCondition:](v13, "initWithCondition:", v14);

  return v15;
}

id __61__RESectionDescriptor_defaultSectionDescriptorForIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RERankingRule *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  REFilteringRule *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  RERankingRule *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  RERankingRule *v45;
  void *v46;
  RERankingRule *v47;
  RERankingRule *v48;
  void *v49;
  RERankingRule *v50;
  id v52;
  RERankingRule *v53;
  void *v54;
  REFilteringRule *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  RERankingRule *v65;
  _QWORD v66[9];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[3];
  _QWORD v71[4];

  v71[2] = *MEMORY[0x24BDAC8D0];
  +[REFeature priorityFeature](REFeature, "priorityFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v2);
  v3 = objc_claimAutoreleasedReturnValue();

  +[REFeature priorityFeature](REFeature, "priorityFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature priorityFeature](REFeature, "priorityFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition conditionForLeftFeature:relation:rightFeature:](REComparisonCondition, "conditionForLeftFeature:relation:rightFeature:", v4, 2, v5);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition conditionForLeftFeature:relation:rightFeature:](REComparisonCondition, "conditionForLeftFeature:relation:rightFeature:", v6, 0, v7);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [RERankingRule alloc];
  v71[0] = v63;
  v71[1] = v62;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](REComparisonCondition, "andConditions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)v3;
  v65 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v8, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v3, v3, v10, 1);

  v11 = *(_QWORD *)(a1 + 32);
  +[REFeature dateFeature](REFeature, "dateFeature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1 + 32);
  +[REFeature locationFeature](REFeature, "locationFeature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_QWORD *)(a1 + 32);
  +[REFeature geofenceFeature](REFeature, "geofenceFeature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature dateFeature](REFeature, "dateFeature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v17);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_QWORD *)(a1 + 40);
  +[REFeature dateFeature](REFeature, "dateFeature");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v19;
  +[REFeature locationFeature](REFeature, "locationFeature");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v20;
  +[REFeature geofenceFeature](REFeature, "geofenceFeature");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v22);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v23) = 1157234688;
  objc_msgSend(v57, "setPriority:", v23);
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  +[REFeature isInDailyRoutineFeature](REFeature, "isInDailyRoutineFeature");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v26, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition notCondition:](RECondition, "notCondition:", v27);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = [REFilteringRule alloc];
  v69[0] = v25;
  v69[1] = v56;
  v29 = (void *)v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[REFilteringRule initWithCondition:type:](v28, "initWithCondition:type:", v31, 0);

  v68[0] = v29;
  v32 = v29;
  v54 = v29;
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasIntegerValue:](RECondition, "conditionForFeature:hasIntegerValue:", v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = [RERankingRule alloc];
  +[RECondition notCondition:](RECondition, "notCondition:", v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v37, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v36, v38, v39, 1);

  LODWORD(v40) = 1157226496;
  -[RERule setPriority:](v53, "setPriority:", v40);
  v67[0] = v32;
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasIntegerValue:](RECondition, "conditionForFeature:hasIntegerValue:", v41, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = [RERankingRule alloc];
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v45, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v64, v44, v46, 1);

  v48 = [RERankingRule alloc];
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v48, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v36, v44, v49, 1);

  v66[0] = v60;
  v66[1] = v59;
  v66[2] = v58;
  v66[3] = v65;
  v66[4] = v57;
  v66[5] = v55;
  v66[6] = v53;
  v66[7] = v47;
  v66[8] = v50;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 9);
  v52 = (id)objc_claimAutoreleasedReturnValue();

  return v52;
}

RERankingRule *__61__RESectionDescriptor_defaultSectionDescriptorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  RERankingRule *v5;
  double v6;

  v2 = a2;
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition conditionForLeftFeature:relation:rightFeature:](REComparisonCondition, "conditionForLeftFeature:relation:rightFeature:", v2, 2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:]([RERankingRule alloc], "initWithLeftCondition:rightCondition:comparisonCondition:order:", v3, v3, v4, 1);
  LODWORD(v6) = 1157234688;
  -[RERule setPriority:](v5, "setPriority:", v6);

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  RESectionDescriptor *v4;
  RESectionDescriptor *v5;
  RESectionDescriptor *v6;
  NSString *name;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  char v12;
  NSOrderedSet *rules;
  NSOrderedSet *v14;
  NSOrderedSet *v15;
  NSOrderedSet *v16;
  int v17;
  REHistoricSectionDescriptor *historicSectionDescriptor;
  REHistoricSectionDescriptor *v19;
  REHistoricSectionDescriptor *v20;
  REHistoricSectionDescriptor *v21;

  v4 = (RESectionDescriptor *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_maxElementCount == v5->_maxElementCount)
      {
        name = self->_name;
        v8 = v5->_name;
        if (name == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = name;
          v11 = -[NSString isEqual:](v10, "isEqual:", v9);

          if (!v11)
            goto LABEL_12;
        }
        rules = self->_rules;
        v14 = v6->_rules;
        if (rules == v14)
        {

        }
        else
        {
          v15 = v14;
          v16 = rules;
          v17 = -[NSOrderedSet isEqual:](v16, "isEqual:", v15);

          if (!v17)
            goto LABEL_12;
        }
        historicSectionDescriptor = self->_historicSectionDescriptor;
        v19 = v6->_historicSectionDescriptor;
        v20 = historicSectionDescriptor;
        v21 = v20;
        if (v20 == v19)
          v12 = 1;
        else
          v12 = -[REHistoricSectionDescriptor isEqual:](v20, "isEqual:", v19);

        goto LABEL_18;
      }
LABEL_12:
      v12 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  int64_t maxElementCount;
  NSUInteger v4;
  uint64_t v5;

  maxElementCount = self->_maxElementCount;
  v4 = -[NSString hash](self->_name, "hash") ^ maxElementCount;
  v5 = -[NSOrderedSet hash](self->_rules, "hash");
  return v4 ^ v5 ^ -[REHistoricSectionDescriptor hash](self->_historicSectionDescriptor, "hash");
}

+ (id)defaultUpNextSectionDescriptorForIdentifier:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v4 = (__CFString *)a3;
  v5 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_3;
  v33[3] = &unk_24CF8D538;
  v34 = &__block_literal_global_57;
  v35 = &__block_literal_global_4_0;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_4;
  v31[3] = &unk_24CF8FB40;
  v6 = (id)MEMORY[0x2199B2434](v33);
  v32 = v6;
  v7 = (void *)MEMORY[0x2199B2434](v31);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_6;
  v29[3] = &unk_24CF8FB40;
  v30 = &__block_literal_global_57;
  v8 = (void *)MEMORY[0x2199B2434](v29);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_7;
  v27[3] = &unk_24CF8FB40;
  v9 = v6;
  v28 = v9;
  v10 = (void *)MEMORY[0x2199B2434](v27);
  v11 = v10;
  if (CFSTR("defaultSectionIdentifier") == v4)
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_8;
    block[3] = &unk_24CF8FBA8;
    v24 = v7;
    v25 = v8;
    v26 = &__block_literal_global_12_1;
    if (defaultUpNextSectionDescriptorForIdentifier__onceToken != -1)
      dispatch_once(&defaultUpNextSectionDescriptorForIdentifier__onceToken, block);
    v14 = (id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor;

    v15 = v24;
    goto LABEL_19;
  }
  if (CFSTR("allDaySectionIdentifier") == v4)
  {
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_9;
    v21[3] = &unk_24CF8B1B0;
    v22 = v10;
    if (defaultUpNextSectionDescriptorForIdentifier__onceToken_16 != -1)
      dispatch_once(&defaultUpNextSectionDescriptorForIdentifier__onceToken_16, v21);
    v14 = (id)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor;
    v15 = v22;
    goto LABEL_19;
  }
  if (CFSTR("tomorrowSectionIdentifier") == v4)
  {
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_10;
    v19[3] = &unk_24CF8B1B0;
    v20 = v10;
    if (defaultUpNextSectionDescriptorForIdentifier__onceToken_17 != -1)
      dispatch_once(&defaultUpNextSectionDescriptorForIdentifier__onceToken_17, v19);
    v14 = (id)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor;
    v15 = v20;
    goto LABEL_19;
  }
  if (CFSTR("upcomingSectionIdentifier") == v4)
  {
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_11;
    v17[3] = &unk_24CF8B1B0;
    v18 = v10;
    if (defaultUpNextSectionDescriptorForIdentifier__onceToken_18 != -1)
      dispatch_once(&defaultUpNextSectionDescriptorForIdentifier__onceToken_18, v17);
    v14 = (id)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor;
    v15 = v18;
LABEL_19:

    goto LABEL_20;
  }
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("defaultSectionIdentifier")))
  {
    v12 = a1;
    v13 = CFSTR("defaultSectionIdentifier");
  }
  else if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("allDaySectionIdentifier")))
  {
    v12 = a1;
    v13 = CFSTR("allDaySectionIdentifier");
  }
  else if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("tomorrowSectionIdentifier")))
  {
    v12 = a1;
    v13 = CFSTR("tomorrowSectionIdentifier");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("upcomingSectionIdentifier")))
    {
      v14 = 0;
      goto LABEL_20;
    }
    v12 = a1;
    v13 = CFSTR("upcomingSectionIdentifier");
  }
  objc_msgSend(v12, "defaultSectionDescriptorForIdentifier:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v14;
}

RERankingRule *__90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  RERankingRule *v5;
  double v6;

  v2 = a2;
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition conditionForLeftFeature:relation:rightFeature:](REComparisonCondition, "conditionForLeftFeature:relation:rightFeature:", v2, 2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:]([RERankingRule alloc], "initWithLeftCondition:rightCondition:comparisonCondition:order:", v3, v3, v4, 1);
  LODWORD(v6) = 1157234688;
  -[RERule setPriority:](v5, "setPriority:", v6);

  return v5;
}

REFilteringRule *__90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  REFilteringRule *v13;
  void *v14;
  REFilteringRule *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v8, -1, 3.18618444e-58);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v9;
        v22[1] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[RECondition andConditions:](RECondition, "andConditions:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v12);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v13 = [REFilteringRule alloc];
  +[RECondition orConditions:](RECondition, "orConditions:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[REFilteringRule initWithCondition:](v13, "initWithCondition:", v14);

  return v15;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RERankingRule *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  RERankingRule *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  RERankingRule *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  REFilteringRule *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  RERankingRule *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  RERankingRule *v56;
  void *v57;
  RERankingRule *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  REFilteringRule *v70;
  void *v71;
  void *v72;
  void *v73;
  RERankingRule *v74;
  void *v75;
  void *v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  REFilteringRule *v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  REFilteringRule *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  REFilteringRule *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  REFilteringRule *v109;
  void *v110;
  void *v111;
  void *v112;
  REFilteringRule *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  double v144;
  void *v145;
  void *v146;
  double v147;
  void *v148;
  void *v149;
  double v150;
  void *v151;
  void *v152;
  double v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  double v159;
  REFilteringRule *v160;
  double v161;
  void *v162;
  void *v163;
  void *v164;
  double v165;
  REFilteringRule *v166;
  double v167;
  void *v168;
  void *v169;
  void *v170;
  REFilteringRule *v171;
  double v172;
  REFilteringRule *v173;
  double v174;
  void *v175;
  void *v176;
  void *v177;
  double v178;
  REFilteringRule *v179;
  double v180;
  void *v181;
  REFilteringRule *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  REFilteringRule *v189;
  id v191;
  REFilteringRule *v192;
  REFilteringRule *v193;
  REFilteringRule *v194;
  REFilteringRule *v195;
  REFilteringRule *v196;
  void *v197;
  REFilteringRule *v198;
  void *v199;
  REFilteringRule *v200;
  void *v201;
  void *v202;
  REFilteringRule *v203;
  REFilteringRule *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  REFilteringRule *v226;
  REFilteringRule *v227;
  void *v228;
  REFilteringRule *v229;
  RERankingRule *v230;
  REFilteringRule *v231;
  REFilteringRule *v232;
  REFilteringRule *v233;
  RERankingRule *v234;
  RERankingRule *v235;
  RERankingRule *v236;
  REFilteringRule *v237;
  void *v238;
  void *v239;
  RERankingRule *v240;
  RERankingRule *v241;
  void *v242;
  void *v243;
  void *v244;
  RERankingRule *v245;
  void *v246;
  void *v247;
  _QWORD v248[28];
  _QWORD v249[2];
  _QWORD v250[2];
  _QWORD v251[2];
  _QWORD v252[2];
  _QWORD v253[2];
  _QWORD v254[4];
  _QWORD v255[4];
  _QWORD v256[2];
  _QWORD v257[3];
  _QWORD v258[2];
  _QWORD v259[2];
  _QWORD v260[2];
  _QWORD v261[2];
  _QWORD v262[3];
  _QWORD v263[2];
  _QWORD v264[4];
  _QWORD v265[3];
  _QWORD v266[2];
  _QWORD v267[2];
  _QWORD v268[2];
  _QWORD v269[2];
  _QWORD v270[2];
  _QWORD v271[2];
  _QWORD v272[3];
  _QWORD v273[2];
  _QWORD v274[4];

  v274[2] = *MEMORY[0x24BDAC8D0];
  +[REFeature priorityFeature](REFeature, "priorityFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v2);
  v3 = objc_claimAutoreleasedReturnValue();

  +[REFeature priorityFeature](REFeature, "priorityFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature priorityFeature](REFeature, "priorityFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition conditionForLeftFeature:relation:rightFeature:](REComparisonCondition, "conditionForLeftFeature:relation:rightFeature:", v4, 2, v5);
  v224 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition conditionForLeftFeature:relation:rightFeature:](REComparisonCondition, "conditionForLeftFeature:relation:rightFeature:", v6, 0, v7);
  v223 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [RERankingRule alloc];
  v274[0] = v224;
  v274[1] = v223;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v274, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](REComparisonCondition, "andConditions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = (void *)v3;
  v245 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v8, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v3, v3, v10, 1);

  v11 = *(_QWORD *)(a1 + 32);
  +[REFeature dateFeature](REFeature, "dateFeature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1 + 32);
  +[REFeature locationFeature](REFeature, "locationFeature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  v243 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_QWORD *)(a1 + 32);
  +[REFeature geofenceFeature](REFeature, "geofenceFeature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature dateFeature](REFeature, "dateFeature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v17);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature dateFeature](REFeature, "dateFeature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1064682127;
  +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v18, 2, v19);
  v221 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [RERankingRule alloc];
  v273[0] = v239;
  v273[1] = v221;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v273, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition notCondition:](RECondition, "notCondition:", v239);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v241 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v20, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v22, v23, v24, 1);

  +[REFeature sessionFeature](REFeature, "sessionFeature");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v25);
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = [RERankingRule alloc];
  +[RECondition notCondition:](RECondition, "notCondition:", v220);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v26, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v220, v27, v28, 1);

  LODWORD(v29) = 1157234688;
  -[RERule setPriority:](v240, "setPriority:", v29);
  v30 = *(_QWORD *)(a1 + 40);
  +[REFeature dateFeature](REFeature, "dateFeature");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v272[0] = v31;
  +[REFeature locationFeature](REFeature, "locationFeature");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v272[1] = v32;
  +[REFeature geofenceFeature](REFeature, "geofenceFeature");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v272[2] = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v272, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v34);
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v35) = 1157234688;
  objc_msgSend(v238, "setPriority:", v35);
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v36);
  v37 = objc_claimAutoreleasedReturnValue();

  +[REFeature isInDailyRoutineFeature](REFeature, "isInDailyRoutineFeature");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v38, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition notCondition:](RECondition, "notCondition:", v39);
  v219 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = [REFilteringRule alloc];
  v271[0] = v37;
  v271[1] = v219;
  v41 = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v271, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v237 = -[REFilteringRule initWithCondition:type:](v40, "initWithCondition:type:", v43, 0);

  v270[0] = v37;
  v218 = (void *)v37;
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasIntegerValue:](RECondition, "conditionForFeature:hasIntegerValue:", v44, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v270[1] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v270, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v46);
  v47 = objc_claimAutoreleasedReturnValue();

  v48 = [RERankingRule alloc];
  +[RECondition notCondition:](RECondition, "notCondition:", v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = (void *)v47;
  v236 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v48, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v47, v49, v50, 1);

  LODWORD(v51) = 1157226496;
  -[RERule setPriority:](v236, "setPriority:", v51);
  v269[0] = v41;
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasIntegerValue:](RECondition, "conditionForFeature:hasIntegerValue:", v52, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v269[1] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v269, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v54);
  v55 = objc_claimAutoreleasedReturnValue();

  v56 = [RERankingRule alloc];
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = (void *)v55;
  v235 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v56, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v239, v55, v57, 1);

  v58 = [RERankingRule alloc];
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v234 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v58, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v47, v55, v59, 1);

  +[REFeature conditionalFeature](REFeature, "conditionalFeature");
  v60 = objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v60);
  v268[0] = objc_claimAutoreleasedReturnValue();
  v61 = v268[0];
  v213 = (void *)v268[0];
  v214 = (void *)v60;
  LODWORD(v62) = 953267991;
  +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v60, -1, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v268[1] = v63;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v268, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v64);
  v215 = (void *)objc_claimAutoreleasedReturnValue();

  v233 = -[REFilteringRule initWithCondition:type:]([REFilteringRule alloc], "initWithCondition:type:", v215, 0);
  v267[0] = v61;
  LODWORD(v65) = 953267991;
  +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v60, 2, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v267[1] = v66;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v267, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v67);
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  v232 = -[REFilteringRule initWithCondition:type:]([REFilteringRule alloc], "initWithCondition:type:", v212, 1);
  +[REFeature noContentFeature](REFeature, "noContentFeature");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v68);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature noContentFeature](REFeature, "noContentFeature");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v69, 1);
  v210 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = [REFilteringRule alloc];
  v266[0] = v211;
  v266[1] = v210;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v266, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = -[REFilteringRule initWithCondition:type:](v70, "initWithCondition:type:", v72, 1);

  +[REFeature isDeveloperDonationFeature](REFeature, "isDeveloperDonationFeature");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v73);
  v209 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = [RERankingRule alloc];
  +[RECondition notCondition:](RECondition, "notCondition:", v209);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition trueCondition](REComparisonCondition, "trueCondition");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v74, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v209, v75, v76, 1);

  LODWORD(v77) = 1157275648;
  -[RERule setPriority:](v230, "setPriority:", v77);
  +[REFeature siriActionRoleFeature](REFeature, "siriActionRoleFeature");
  v78 = objc_claimAutoreleasedReturnValue();
  +[REFeature siriActionDailyAveragePerformedCountFeature](REFeature, "siriActionDailyAveragePerformedCountFeature");
  v79 = objc_claimAutoreleasedReturnValue();
  v80 = [REFilteringRule alloc];
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v78);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v265[0] = v81;
  +[RECondition conditionForFeature:hasIntegerValue:](RECondition, "conditionForFeature:hasIntegerValue:", v78, 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v265[1] = v82;
  v206 = (void *)v79;
  LODWORD(v83) = 1039516303;
  +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v79, -1, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v265[2] = v84;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v265, 3);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = -[REFilteringRule initWithCondition:](v80, "initWithCondition:", v86);

  +[REFeature siriActionHasRelevanceProvidersFeature](REFeature, "siriActionHasRelevanceProvidersFeature");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = [REFilteringRule alloc];
  v208 = (void *)v78;
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v78);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v264[0] = v88;
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v207);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v264[1] = v89;
  +[RECondition conditionForFeature:hasIntegerValue:](RECondition, "conditionForFeature:hasIntegerValue:", v78, 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v264[2] = v90;
  LODWORD(v91) = 1039516303;
  +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v79, -1, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v264[3] = v92;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v264, 4);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = -[REFilteringRule initWithCondition:](v87, "initWithCondition:", v94);

  +[REFeature workoutStateFeature](REFeature, "workoutStateFeature");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = [REFilteringRule alloc];
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v228);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v263[0] = v96;
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v228, 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v263[1] = v97;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v263, 2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = -[REFilteringRule initWithCondition:type:](v95, "initWithCondition:type:", v99, 0);

  +[REFeature dailyAverageWorkoutCountFeature](REFeature, "dailyAverageWorkoutCountFeature");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v246);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v262[0] = v100;
  +[REFeature performedWorkoutCountFeature](REFeature, "performedWorkoutCountFeature");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v262[1] = v102;
  +[REFeature performedWorkoutCountFeature](REFeature, "performedWorkoutCountFeature");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dailyAverageWorkoutCountFeature](REFeature, "dailyAverageWorkoutCountFeature");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer roundTransformer](REFeatureTransformer, "roundTransformer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "featureByUsingTransformer:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:relation:feature:](RECondition, "conditionForFeature:relation:feature:", v103, 1, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v262[2] = v107;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v262, 3);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v108);
  v205 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = [REFilteringRule alloc];
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v228);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v261[0] = v110;
  v261[1] = v205;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v261, 2);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = -[REFilteringRule initWithCondition:type:](v109, "initWithCondition:type:", v112, 0);

  v113 = [REFilteringRule alloc];
  +[REFeature isDeveloperDonationFeature](REFeature, "isDeveloperDonationFeature");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v260[0] = v115;
  +[REFeature isDeveloperDonationFeature](REFeature, "isDeveloperDonationFeature");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v116, 1);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v260[1] = v117;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v260, 2);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = -[REFilteringRule initWithCondition:type:](v113, "initWithCondition:type:", v119, 1);

  LODWORD(v120) = 1157275648;
  -[RERule setPriority:](v203, "setPriority:", v120);
  +[REFeature nowPlayingStateFeature](REFeature, "nowPlayingStateFeature");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v259[0] = v122;
  +[REFeature nowPlayingStateFeature](REFeature, "nowPlayingStateFeature");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v123, 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v259[1] = v124;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v259, 2);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v125);
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature isSiriActionFeature](REFeature, "isSiriActionFeature");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v258[0] = v127;
  +[REFeature isSiriActionFeature](REFeature, "isSiriActionFeature");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v128, 1);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v258[1] = v129;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v258, 2);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v130);
  v247 = (void *)objc_claimAutoreleasedReturnValue();

  v257[0] = v247;
  +[REFeature siriActionRoleFeature](REFeature, "siriActionRoleFeature");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v257[1] = v132;
  +[REFeature siriActionRoleFeature](REFeature, "siriActionRoleFeature");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasIntegerValue:](RECondition, "conditionForFeature:hasIntegerValue:", v133, 1);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v257[2] = v134;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v257, 3);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature siriActionHasRelevanceProvidersFeature](REFeature, "siriActionHasRelevanceProvidersFeature");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v256[0] = v138;
  +[REFeature siriActionHasRelevanceProvidersFeature](REFeature, "siriActionHasRelevanceProvidersFeature");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v139, 1);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v256[1] = v140;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v256, 2);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v141);
  v142 = objc_claimAutoreleasedReturnValue();

  v255[0] = v247;
  +[RECondition notCondition:](RECondition, "notCondition:", v136);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v255[1] = v143;
  v255[2] = v142;
  v201 = (void *)v142;
  LODWORD(v144) = 1038174126;
  +[RECondition conditionForProbabilityForInteraction:relation:floatValue:](RECondition, "conditionForProbabilityForInteraction:relation:floatValue:", CFSTR("app-action"), -2, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v255[3] = v145;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v255, 4);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v146);
  v202 = (void *)objc_claimAutoreleasedReturnValue();

  v200 = -[REFilteringRule initWithCondition:]([REFilteringRule alloc], "initWithCondition:", v202);
  LODWORD(v147) = 1149009920;
  -[RERule setPriority:](v200, "setPriority:", v147);
  v254[0] = v247;
  +[RECondition notCondition:](RECondition, "notCondition:", v136);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v254[1] = v148;
  +[RECondition notCondition:](RECondition, "notCondition:", v142);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v254[2] = v149;
  LODWORD(v150) = 1045220557;
  +[RECondition conditionForProbabilityForInteraction:relation:floatValue:](RECondition, "conditionForProbabilityForInteraction:relation:floatValue:", CFSTR("app-action"), -2, v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v254[3] = v151;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v254, 4);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v152);
  v199 = (void *)objc_claimAutoreleasedReturnValue();

  v198 = -[REFilteringRule initWithCondition:]([REFilteringRule alloc], "initWithCondition:", v199);
  LODWORD(v153) = 1148993536;
  -[RERule setPriority:](v198, "setPriority:", v153);
  +[REFeature relevanceThresholdFeature](REFeature, "relevanceThresholdFeature");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v253[0] = v155;
  +[REFeature relevanceThresholdFeature](REFeature, "relevanceThresholdFeature");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForProbabilityForInteraction:relation:feature:](RECondition, "conditionForProbabilityForInteraction:relation:feature:", 0, -2, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v253[1] = v157;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v253, 2);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v158);
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  v196 = -[REFilteringRule initWithCondition:]([REFilteringRule alloc], "initWithCondition:", v197);
  LODWORD(v159) = 1148977152;
  -[RERule setPriority:](v196, "setPriority:", v159);
  v160 = [REFilteringRule alloc];
  v252[0] = v225;
  LODWORD(v161) = 1054280253;
  +[RECondition conditionForProbabilityWithRelation:floatValue:](RECondition, "conditionForProbabilityWithRelation:floatValue:", -2, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v252[1] = v162;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v252, 2);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = -[REFilteringRule initWithCondition:](v160, "initWithCondition:", v164);

  LODWORD(v165) = 1148960768;
  -[RERule setPriority:](v195, "setPriority:", v165);
  v166 = [REFilteringRule alloc];
  v251[0] = v136;
  LODWORD(v167) = 1045220557;
  +[RECondition conditionForProbabilityWithRelation:floatValue:](RECondition, "conditionForProbabilityWithRelation:floatValue:", -2, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v251[1] = v168;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v251, 2);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = -[REFilteringRule initWithCondition:](v166, "initWithCondition:", v170);

  LODWORD(v172) = 1148944384;
  v193 = v171;
  -[RERule setPriority:](v171, "setPriority:", v172);
  v173 = [REFilteringRule alloc];
  v250[0] = v247;
  LODWORD(v174) = 1041865114;
  +[RECondition conditionForProbabilityWithRelation:floatValue:](RECondition, "conditionForProbabilityWithRelation:floatValue:", -2, v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v250[1] = v175;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v250, 2);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = -[REFilteringRule initWithCondition:](v173, "initWithCondition:", v177);

  LODWORD(v178) = 1148928000;
  -[RERule setPriority:](v171, "setPriority:", v178);
  v179 = [REFilteringRule alloc];
  LODWORD(v180) = 1034147594;
  +[RECondition conditionForProbabilityWithRelation:floatValue:](RECondition, "conditionForProbabilityWithRelation:floatValue:", -2, v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = -[REFilteringRule initWithCondition:](v179, "initWithCondition:", v181);

  v182 = [REFilteringRule alloc];
  +[REFeature activitySummaryFeature](REFeature, "activitySummaryFeature");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v249[0] = v184;
  +[REFeature activitySummaryFeature](REFeature, "activitySummaryFeature");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v185, 0);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v249[1] = v186;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v249, 2);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = -[REFilteringRule initWithCondition:type:](v182, "initWithCondition:type:", v188, 0);

  v248[0] = v244;
  v248[1] = v243;
  v248[2] = v242;
  v248[3] = v245;
  v248[4] = v238;
  v248[5] = v240;
  v248[6] = v241;
  v248[7] = v237;
  v248[8] = v236;
  v248[9] = v235;
  v248[10] = v234;
  v248[11] = v231;
  v248[12] = v233;
  v248[13] = v232;
  v248[14] = v230;
  v248[15] = v229;
  v248[16] = v227;
  v248[17] = v226;
  v248[18] = v204;
  v248[19] = v203;
  v248[20] = v200;
  v248[21] = v198;
  v248[22] = v196;
  v248[23] = v195;
  v248[24] = v193;
  v248[25] = v194;
  v248[26] = v192;
  v248[27] = v189;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v248, 28);
  v191 = (id)objc_claimAutoreleasedReturnValue();

  return v191;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  REFilteringRule *v6;
  void *v7;
  void *v8;
  REFilteringRule *v9;
  void *v10;
  void *v11;
  void *v12;
  REFilteringRule *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  +[REFeature dateOccursTodayFeature](REFeature, "dateOccursTodayFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature dateOccursTodayFeature](REFeature, "dateOccursTodayFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [REFilteringRule alloc];
  v15[0] = v3;
  v15[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REFilteringRule initWithCondition:](v6, "initWithCondition:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_5()
{
  void *v0;
  void *v1;
  REFilteringRule *v2;
  void *v3;
  void *v4;
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
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  REFilteringRule *v32;
  void *v33;
  void *v34;
  REFilteringRule *v35;
  REFilteringRule *v36;
  void *v37;
  void *v38;
  REFilteringRule *v39;
  REFilteringRule *v40;
  void *v41;
  void *v42;
  REFilteringRule *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  REFilteringRule *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[4];
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x24BDAC8D0];
  +[REFeature currentlyPlayingMediaDonationFeature](REFeature, "currentlyPlayingMediaDonationFeature");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature currentlyPlayingMediaDonationFeature](REFeature, "currentlyPlayingMediaDonationFeature");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v1, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = [REFilteringRule alloc];
  v62[0] = v52;
  v62[1] = v51;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[REFilteringRule initWithCondition:type:](v2, "initWithCondition:type:", v4, 0);

  +[REFeature isSiriActionFeature](REFeature, "isSiriActionFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v6;
  +[REFeature isSiriActionFeature](REFeature, "isSiriActionFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  +[RECondition notCondition:](RECondition, "notCondition:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dateFeature](REFeature, "dateFeature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v11;
  +[REFeature dateOccursTodayFeature](REFeature, "dateOccursTodayFeature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v13;
  +[REFeature dateFeature](REFeature, "dateFeature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 0;
  +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v14, 2, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v16;
  +[REFeature dateOccursTodayFeature](REFeature, "dateOccursTodayFeature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionForFeature:hasBoolValue:](RECondition, "conditionForFeature:hasBoolValue:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v19);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature locationFeature](REFeature, "locationFeature");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v21;
  +[REFeature locationFeature](REFeature, "locationFeature");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 0;
  +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v22, 2, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v25);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature geofenceFeature](REFeature, "geofenceFeature");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v27;
  +[REFeature geofenceFeature](REFeature, "geofenceFeature");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 0;
  +[RECondition conditionForFeature:relation:floatValue:](RECondition, "conditionForFeature:relation:floatValue:", v28, 2, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v31);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = [REFilteringRule alloc];
  v57[0] = v48;
  v57[1] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[REFilteringRule initWithCondition:type:](v32, "initWithCondition:type:", v34, 1);

  v36 = [REFilteringRule alloc];
  v56[0] = v48;
  v56[1] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[REFilteringRule initWithCondition:type:](v36, "initWithCondition:type:", v38, 1);

  v40 = [REFilteringRule alloc];
  v55[0] = v48;
  v55[1] = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition andConditions:](RECondition, "andConditions:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[REFilteringRule initWithCondition:type:](v40, "initWithCondition:type:", v42, 1);

  v54[0] = v50;
  v54[1] = v35;
  v54[2] = v39;
  v54[3] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  RERankingRule *v6;
  void *v7;
  void *v8;
  RERankingRule *v9;
  double v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  +[REFeature recentSiriActionFeature](REFeature, "recentSiriActionFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dateFeature](REFeature, "dateFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REComparisonCondition conditionForLeftFeature:relation:rightFeature:](REComparisonCondition, "conditionForLeftFeature:relation:rightFeature:", v2, 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [RERankingRule alloc];
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v6, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v7, v8, v5, 1);

  LODWORD(v10) = 1157234688;
  -[RERule setPriority:](v9, "setPriority:", v10);
  v13[0] = v3;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_7(uint64_t a1)
{
  REFilteringRule *v2;
  void *v3;
  REFilteringRule *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = [REFilteringRule alloc];
  +[RECondition trueCondition](RECondition, "trueCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REFilteringRule initWithCondition:type:](v2, "initWithCondition:type:", v3, 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_8(_QWORD *a1)
{
  RESectionDescriptor *v2;
  void *v3;
  void *v4;
  void *v5;
  REHistoricSectionDescriptor *v6;
  void *v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(void);

  v2 = objc_alloc_init(RESectionDescriptor);
  v3 = (void *)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor;
  defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor = (uint64_t)v2;

  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor, "setName:", CFSTR("defaultSectionIdentifier"));
  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor, "setMaxElementCount:", -1);
  v4 = (void *)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor;
  (*(void (**)(void))(a1[4] + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrderedRules:", v5);

  v6 = objc_alloc_init(REHistoricSectionDescriptor);
  -[REHistoricSectionDescriptor setMaxElementCount:](v6, "setMaxElementCount:", -1);
  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor, "orderedRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHistoricSectionDescriptor setOrderedRules:](v6, "setOrderedRules:", v7);

  -[REHistoricSectionDescriptor setInvertsRanking:](v6, "setInvertsRanking:", 1);
  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor, "setHistoricSectionDescriptor:", v6);
  v8 = (void (**)(_QWORD))MEMORY[0x2199B2434](a1[5]);
  if (v8)
  {
    -[REHistoricSectionDescriptor orderedRules](v6, "orderedRules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REHistoricSectionDescriptor setOrderedRules:](v6, "setOrderedRules:", v11);

  }
  v16 = (void (**)(void))MEMORY[0x2199B2434](a1[6]);
  if (v16)
  {
    v12 = (void *)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor;
    objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REDefaultSectionIdentifierDescriptor, "orderedRules");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOrderedRules:", v15);

  }
}

void __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_9(uint64_t a1)
{
  RESectionDescriptor *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc_init(RESectionDescriptor);
  v3 = (void *)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor;
  defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor = (uint64_t)v2;

  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor, "setName:", CFSTR("allDaySectionIdentifier"));
  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor, "setMaxElementCount:", -1);
  v4 = (void *)defaultUpNextSectionDescriptorForIdentifier__REAllDaySectionIdentifierDescriptor;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrderedRules:", v5);

}

void __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_10(uint64_t a1)
{
  RESectionDescriptor *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc_init(RESectionDescriptor);
  v3 = (void *)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor;
  defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor = (uint64_t)v2;

  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor, "setName:", CFSTR("tomorrowSectionIdentifier"));
  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor, "setMaxElementCount:", -1);
  v4 = (void *)defaultUpNextSectionDescriptorForIdentifier__RETomorrowSectionIdentifierDescriptor;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrderedRules:", v5);

}

void __90__RESectionDescriptor_REUpNextConfiguration__defaultUpNextSectionDescriptorForIdentifier___block_invoke_11(uint64_t a1)
{
  RESectionDescriptor *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc_init(RESectionDescriptor);
  v3 = (void *)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor;
  defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor = (uint64_t)v2;

  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor, "setName:", CFSTR("upcomingSectionIdentifier"));
  objc_msgSend((id)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor, "setMaxElementCount:", -1);
  v4 = (void *)defaultUpNextSectionDescriptorForIdentifier__REThisWeekSectionIdentifierDescriptor;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrderedRules:", v5);

}

@end
