@implementation _REMLConditionExplanation

- (_REMLConditionExplanation)initWithCondition:(id)a3
{
  id v5;
  _REMLConditionExplanation *v6;
  _REMLConditionExplanation *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_REMLConditionExplanation;
  v6 = -[_REMLConditionExplanation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_condition, a3);
    v7->_type = 6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 1;
LABEL_12:
      v7->_type = v8;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 3;
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 2;
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 4;
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 5;
      goto LABEL_12;
    }
  }
LABEL_13:

  return v7;
}

- (id)explanationByCombiningWithExplanation:(id)a3
{
  _REMLConditionExplanation *v4;
  _REMLConditionExplanation *v5;
  _REMLConditionExplanation *v6;

  v4 = (_REMLConditionExplanation *)a3;
  if (-[REMLExplanation rankExplanationToExplanation:](self, "rankExplanationToExplanation:", v4) == -1)
    v5 = self;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (int64_t)_rankExplanationToSimilarExplanation:(id)a3
{
  void *v3;
  unint64_t type;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v3 = (void *)MEMORY[0x24BDD16E0];
  type = self->_type;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = v5[2];

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (_REMLConditionExplanation)explanationWithStyle:(unint64_t)a3
{
  void *v3;
  _REMLConditionExplanation *result;

  switch(self->_type)
  {
    case 1uLL:
      -[_REMLConditionExplanation _constantConditionExplanationWithStyle:](self, "_constantConditionExplanationWithStyle:", a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2uLL:
      -[_REMLConditionExplanation _probabilityExplanation:withStyle:](self, "_probabilityExplanation:withStyle:", self->_condition, a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3uLL:
      -[_REMLConditionExplanation _featureRuleExplanation:withStyle:](self, "_featureRuleExplanation:withStyle:", self->_condition, a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
      -[_REMLConditionExplanation _valueExplanation:withStyle:](self, "_valueExplanation:withStyle:", self->_condition, a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5uLL:
      -[_REMLConditionExplanation _hasFeatureExplanation:withStyle:](self, "_hasFeatureExplanation:withStyle:", self->_condition, a3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      result = v3;
      break;
    default:
      result = &stru_24CF92178;
      break;
  }
  return result;
}

- (id)_constantConditionExplanationWithStyle:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("condition is always true");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("always true");
}

- (id)_featureRuleExplanation:(id)a3 withStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(v6, "firstFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLExplanation _formattedNameForFeature:style:](self, "_formattedNameForFeature:style:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "secondFeature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLExplanation _formattedNameForFeature:style:](self, "_formattedNameForFeature:style:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "relation");
  if (a4 == 1)
  {
    if ((unint64_t)(v11 + 2) <= 6)
    {
      v12 = off_24CF914E8[v11 + 2];
      goto LABEL_7;
    }
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  if (a4)
    goto LABEL_6;
  RERelationDescription(v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@"), v8, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_probabilityExplanation:(id)a3 withStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v18;
  void *v19;

  v6 = a3;
  objc_msgSend(v6, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "feature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMLExplanation _formattedNameForFeature:style:](self, "_formattedNameForFeature:style:", v8, a4);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "threshold");
    objc_msgSend(v9, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "interaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (a4 != 1)
    {
      if (!a4)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "interaction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ prob"), v13);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        RERelationDescription(objc_msgSend(v6, "relation"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
LABEL_12:
      objc_msgSend(v6, "relation");
      v14 = 0;
LABEL_13:
      v15 = 0;
      goto LABEL_14;
    }
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "interaction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("probability for %@"), v19);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a4 != 1)
    {
      if (!a4)
      {
        v14 = CFSTR("prob");
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    v14 = CFSTR("probability");
  }
  v15 = CFSTR("less than");
  switch(objc_msgSend(v6, "relation"))
  {
    case -2:
      break;
    case -1:
      v15 = CFSTR("less than or equal to");
      break;
    case 0:
      v15 = CFSTR("equal to");
      break;
    case 1:
      v15 = CFSTR("greater than or equal to");
      break;
    case 2:
      v15 = CFSTR("greater than");
      break;
    case 4:
      v15 = CFSTR("not equal to");
      break;
    default:
      goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@"), v14, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_valueExplanation:(id)a3 withStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  v6 = a3;
  REDescriptionForTaggedPointer((void *)objc_msgSend(v6, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLExplanation _formattedNameForFeature:style:](self, "_formattedNameForFeature:style:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "relation");
  if (a4 == 1)
  {
    if ((unint64_t)(v10 + 2) <= 6)
    {
      v11 = off_24CF914E8[v10 + 2];
      goto LABEL_7;
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  if (a4)
    goto LABEL_6;
  RERelationDescription(v10);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@"), v9, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_hasFeatureExplanation:(id)a3 withStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;

  v6 = a3;
  objc_msgSend(v6, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLExplanation _formattedNameForFeature:style:](self, "_formattedNameForFeature:style:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v6, "contains");
  v9 = CFSTR("doesn't");
  if ((_DWORD)v7)
    v9 = &stru_24CF92178;
  v10 = v9;
  if (a4)
  {
    if (a4 != 1)
    {
      v12 = CFSTR("Unknown style");
      goto LABEL_9;
    }
    v11 = CFSTR("%@contains value for %@");
  }
  else
  {
    v11 = CFSTR("%@contains %@");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v10, v8);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
