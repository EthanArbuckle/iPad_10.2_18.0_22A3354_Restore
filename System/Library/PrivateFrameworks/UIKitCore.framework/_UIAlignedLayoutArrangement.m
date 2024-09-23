@implementation _UIAlignedLayoutArrangement

+ (Class)_configurationHistoryClass
{
  return (Class)objc_opt_class();
}

- (_UIAlignedLayoutArrangement)initWithItems:(id)a3
{
  _UIAlignedLayoutArrangement *v3;
  uint64_t v4;
  NSMutableDictionary *alignmentConstraints;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAlignedLayoutArrangement;
  v3 = -[_UILayoutArrangement initWithItems:](&v7, sel_initWithItems_, a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
    alignmentConstraints = v3->_alignmentConstraints;
    v3->_alignmentConstraints = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)setLayoutFillsCanvas:(BOOL)a3
{
  -[_UILayoutArrangement _setLayoutFillsCanvas:notify:](self, "_setLayoutFillsCanvas:notify:", a3, 0);
}

- (id)_identifierForSpanningLayoutGuide
{
  return CFSTR("UISV-alignment-spanner");
}

- (void)_setUpConstraintForItem:(id)a3 referenceItem:(id)a4 attribute:(int64_t)a5 inConstraintsTable:(id)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  const __CFString *v13;
  void *v14;
  id v15;
  char v16;
  int64_t v17;
  id v18;

  v18 = a3;
  v9 = a4;
  v10 = a6;
  if ((unint64_t)(a5 - 7) > 1)
  {
    if (qword_1ECD7ACD0 != -1)
      dispatch_once(&qword_1ECD7ACD0, &__block_literal_global_623);
    v15 = v18;
    if ((a5 - 11) <= 1 && _MergedGlobals_17_3)
    {
      v16 = objc_msgSend(v18, "_hasBaseline");
      v15 = v18;
      v17 = 3;
      if (a5 != 12)
        v17 = 4;
      if ((v16 & 1) == 0)
        a5 = v17;
    }
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v9, a5, 0, v15, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    v13 = CFSTR("UISV-alignment");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", v18, a5, 0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 25.0;
    objc_msgSend(v11, "setPriority:", v12);
    v13 = CFSTR("UISV-ambiguity-suppression");
    v14 = v11;
  }
  objc_msgSend(v14, "setIdentifier:", v13);
  objc_msgSend(v11, "setActive:", 1);
  objc_msgSend(v10, "setObject:forKey:", v11, v18);

}

- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3
{
  id v5;
  unint64_t result;
  void *v7;
  unint64_t v8;
  unint64_t alignment;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIAlignedLayoutArrangement;
  v5 = -[_UILayoutArrangement _indexOfItemForLocationAttribute:](&v10, sel__indexOfItemForLocationAttribute_);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    result = (unint64_t)v5;
    if (v8 >= 2)
    {
      if (-[_UILayoutArrangement axis](self, "axis"))
      {
        if (a3 > 0x25)
          goto LABEL_29;
        if (((1 << a3) & 0x2A00119D19) != 0)
          return 0x7FFFFFFFFFFFFFFFLL;
        if (((1 << a3) & 0x14000C42C4) == 0)
        {
LABEL_29:
          if ((self->_alignment & 0x22) != 0)
            return 0;
        }
        if ((a3 > 0x23 || ((1 << a3) & 0xF001ABFABLL) == 0) && (self->_alignment & 0x44) != 0)
        {
          return 0;
        }
        else
        {
          result = 0x7FFFFFFFFFFFFFFFLL;
          if (a3 == 9 && (self->_alignment & 0x200) != 0)
            return 0;
        }
      }
      else
      {
        result = 0x7FFFFFFFFFFFFFFFLL;
        if (a3 <= 0x25 && ((1 << a3) & 0x2A00119D19) != 0)
        {
          switch(a3)
          {
            case 3:
            case 12:
              alignment = self->_alignment;
              if ((alignment & 0x1008) != 0)
                return 0;
              switch(a3)
              {
                case 11:
                  goto LABEL_14;
                case 10:
                  goto LABEL_25;
                case 4:
                  goto LABEL_14;
              }
              break;
            case 4:
            case 11:
LABEL_14:
              alignment = self->_alignment;
              if ((alignment & 0x810) != 0)
                return 0;
              if (a3 == 10)
                goto LABEL_25;
              break;
            case 10:
              alignment = self->_alignment;
LABEL_25:
              if ((alignment & 0x400) != 0)
                result = 0;
              else
                result = 0x7FFFFFFFFFFFFFFFLL;
              break;
            default:
              return result;
          }
        }
      }
    }
  }
  return result;
}

- (void)_addConstraintGroupsAsNecessary
{
  void *v3;
  uint64_t v4;
  void (**v5)(void *, const __CFString *);
  NSMutableDictionary *alignmentConstraints;
  _QWORD v7[5];
  id v8;
  _QWORD aBlock[5];

  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62___UIAlignedLayoutArrangement__addConstraintGroupsAsNecessary__block_invoke;
    aBlock[3] = &unk_1E16B64F8;
    aBlock[4] = self;
    v5 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
    v5[2](v5, CFSTR("Top"));
    v5[2](v5, CFSTR("Leading"));
    v5[2](v5, CFSTR("Bottom"));
    v5[2](v5, CFSTR("Trailing"));
    v5[2](v5, CFSTR("CenterX"));
    v5[2](v5, CFSTR("CenterY"));
    v5[2](v5, CFSTR("Ambiguity Suppression"));
    alignmentConstraints = self->_alignmentConstraints;
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __62___UIAlignedLayoutArrangement__addConstraintGroupsAsNecessary__block_invoke_2;
    v7[3] = &unk_1E16E9600;
    v7[4] = self;
    v8 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](alignmentConstraints, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
}

- (int64_t)_axisForSpanningLayoutGuide
{
  void *v2;
  int64_t v3;

  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "axis") == 0;

  return v3;
}

- (int64_t)_attributeForConstraintGroupName:(id)a3
{
  id v5;
  void *v6;
  char v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v13;

  v5 = a3;
  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "alignment");

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Top")))
  {
    v8 = (v7 & 8) == 0;
    v9 = 3;
    v10 = 12;
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Leading")) & 1) != 0)
  {
    v11 = 5;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Bottom")))
  {
    v8 = (v7 & 0x10) == 0;
    v9 = 4;
    v10 = 11;
LABEL_7:
    if (v8)
      v11 = v10;
    else
      v11 = v9;
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Trailing")) & 1) != 0)
  {
    v11 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CenterX")) & 1) != 0)
  {
    v11 = 9;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CenterY")) & 1) != 0)
  {
    v11 = 10;
  }
  else if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Ambiguity Suppression"))
         || (v11 = -[_UILayoutArrangement _dimensionAttributeForCurrentAxis](self, "_dimensionAttributeForCurrentAxis")) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAlignedLayoutArrangement.m"), 521, CFSTR("Couldn't find attribute for constraint group %@"), v5);

    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (BOOL)_wantsConstraintsForAttribute:(int64_t)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  unint64_t v8;

  v5 = a3 <= 0x25 && ((1 << a3) & 0x2A00119D19) != 0;
  LODWORD(v6) = -[_UIAlignedLayoutArrangement _wantsConstraintsUsingAttributesForAxis:](self, "_wantsConstraintsUsingAttributesForAxis:", v5);
  if (v6)
  {
    if ((unint64_t)(a3 - 7) > 1)
    {
      -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "alignment");

      LOBYTE(v6) = 0;
      switch(a3)
      {
        case 3:
          v6 = (v8 >> 3) & 1;
          break;
        case 4:
          v6 = (v8 >> 4) & 1;
          break;
        case 5:
          v6 = (v8 >> 5) & 1;
          break;
        case 6:
          v6 = (v8 >> 6) & 1;
          break;
        case 9:
          v6 = (v8 >> 9) & 1;
          break;
        case 10:
          v6 = (v8 >> 10) & 1;
          break;
        case 11:
          v6 = (v8 >> 11) & 1;
          break;
        case 12:
          v6 = (v8 >> 12) & 1;
          break;
        default:
          return v6;
      }
    }
    else
    {
      LOBYTE(v6) = -[_UIAlignedLayoutArrangement _wantsAmbiguitySuppressionConstraints](self, "_wantsAmbiguitySuppressionConstraints");
    }
  }
  return v6;
}

- (BOOL)_wantsConstraintsUsingAttributesForAxis:(int64_t)a3
{
  void *v4;

  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "axis") != a3;

  return a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (BOOL)_wantsAmbiguitySuppressionConstraints
{
  void *v2;
  char v3;
  BOOL v4;

  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ~objc_msgSend(v2, "alignment");
  v4 = (v3 & 0x60) != 0 && (v3 & 0x18) != 0;

  return v4;
}

- (void)_updateArrangementConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIAlignedLayoutArrangement;
  -[_UILayoutArrangement _updateArrangementConstraints](&v4, sel__updateArrangementConstraints);
  -[_UIAlignedLayoutArrangement _alignmentConfigurationHistory](self, "_alignmentConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInAlignmentLayoutUpdateSection:", 1);
  if (-[_UIAlignedLayoutArrangement _hasStaleConfiguration](self, "_hasStaleConfiguration"))
  {
    -[_UIAlignedLayoutArrangement _removeConstraintGroupsAsNecessary](self, "_removeConstraintGroupsAsNecessary");
    -[_UIAlignedLayoutArrangement _removeIndividualConstraintsAsNecessary](self, "_removeIndividualConstraintsAsNecessary");
    -[_UIAlignedLayoutArrangement _addIndividualConstraintsIfPossible](self, "_addIndividualConstraintsIfPossible");
    -[_UIAlignedLayoutArrangement _addConstraintGroupsAsNecessary](self, "_addConstraintGroupsAsNecessary");
  }
  -[_UIAlignedLayoutArrangement _updateConfigurationHistory](self, "_updateConfigurationHistory");
  objc_msgSend(v3, "setInAlignmentLayoutUpdateSection:", 0);

}

- (void)_updateConfigurationHistory
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_UIAlignedLayoutArrangement _alignmentConfigurationHistory](self, "_alignmentConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInAlignmentLayoutUpdateSection"))
  {
    objc_msgSend(v3, "setHasEstablishedAlignmentValues:", 1);
    -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlignment:", objc_msgSend(v4, "alignment"));

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIAlignedLayoutArrangement;
  -[_UILayoutArrangement _updateConfigurationHistory](&v5, sel__updateConfigurationHistory);

}

- (int64_t)_layoutRelationForCanvasConnectionForAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t result;

  -[_UILayoutArrangement _viewOrGuideForLocationAttribute:](self, "_viewOrGuideForLocationAttribute:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILayoutArrangement _spanningLayoutGuide](self, "_spanningLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0;
  if ((unint64_t)(a3 - 11) <= 0xFFFFFFFFFFFFFFFDLL && v5 != v6)
  {
    if (-[_UIAlignedLayoutArrangement _usesInequalitySpanningConstraintForAttribute:](self, "_usesInequalitySpanningConstraintForAttribute:", a3))
    {
      if (a3 > 0x25)
        return -1;
      else
        return qword_186684ED0[(int)a3];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)_hasStaleConfiguration
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIAlignedLayoutArrangement;
  if (-[_UILayoutArrangement _hasStaleConfiguration](&v8, sel__hasStaleConfiguration))
    return 1;
  -[_UIAlignedLayoutArrangement _alignmentConfigurationHistory](self, "_alignmentConfigurationHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasEstablishedAlignmentValues"))
  {
    v6 = objc_msgSend(v4, "alignment");
    v3 = v6 != objc_msgSend(v5, "alignment");
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (BOOL)_canvasConnectionConstraintsNeedUpdatePass
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIAlignedLayoutArrangement;
  if (-[_UILayoutArrangement _canvasConnectionConstraintsNeedUpdatePass](&v10, sel__canvasConnectionConstraintsNeedUpdatePass))
  {
    return 1;
  }
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 0;
  -[_UIAlignedLayoutArrangement _alignmentConfigurationHistory](self, "_alignmentConfigurationHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "alignment");
  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7 != objc_msgSend(v8, "alignment");

  return v3;
}

- (BOOL)_usesInequalitySpanningConstraintForAttribute:(int64_t)a3
{
  void *v5;
  char v6;
  BOOL v7;
  BOOL result;
  objc_super v9;

  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "alignment");

  switch(a3)
  {
    case 3:
      v7 = (v6 & 8) == 0;
      goto LABEL_7;
    case 4:
      v7 = (v6 & 0x10) == 0;
      goto LABEL_7;
    case 5:
      v7 = (v6 & 0x20) == 0;
      goto LABEL_7;
    case 6:
      v7 = (v6 & 0x40) == 0;
LABEL_7:
      result = v7;
      break;
    default:
      v9.receiver = self;
      v9.super_class = (Class)_UIAlignedLayoutArrangement;
      result = -[_UILayoutArrangement _usesInequalitySpanningConstraintForAttribute:](&v9, sel__usesInequalitySpanningConstraintForAttribute_, a3);
      break;
  }
  return result;
}

- (void)setAlignment:(unint64_t)a3
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if ((~(_WORD)a3 & 0x1008) == 0 || (a3 & 0x810) == 0x810)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAlignedLayoutArrangement.m"), 231, CFSTR(" Can't align Top and FirstBaseline or Bottom and LastBaseline at the same time."));

  }
  if (self->_alignment != a3)
  {
    v6 = -[_UIAlignedLayoutArrangement _requiresNotificationForHasBaselinePropertyChanges](self, "_requiresNotificationForHasBaselinePropertyChanges");
    self->_alignment = a3;
    if (v6 != -[_UIAlignedLayoutArrangement _requiresNotificationForHasBaselinePropertyChanges](self, "_requiresNotificationForHasBaselinePropertyChanges"))-[_UILayoutArrangement _hasBaselineChangedNotificationRequirementDidChange](self, "_hasBaselineChangedNotificationRequirementDidChange");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44___UIAlignedLayoutArrangement_setAlignment___block_invoke;
    v10[3] = &__block_descriptor_40_e36_v16__0___UIALAConfigurationHistory_8l;
    v10[4] = a3;
    -[_UILayoutArrangement _trackChangesWithConfigBlock:](self, "_trackChangesWithConfigBlock:", v10);
    -[_UILayoutArrangement canvas](self, "canvas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v7);

    -[_UILayoutArrangement canvas](self, "canvas");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_vendedBaselineViewParametersDidChange");

  }
}

- (BOOL)_requiresNotificationForHasBaselinePropertyChanges
{
  unint64_t alignment;
  _BOOL8 v4;

  if (qword_1ECD7ACD0 != -1)
    dispatch_once(&qword_1ECD7ACD0, &__block_literal_global_623);
  if (_MergedGlobals_17_3)
  {
    alignment = self->_alignment;
    if ((alignment & 0x1000) != 0)
      LOBYTE(v4) = 1;
    else
      return (alignment >> 11) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_removeIndividualConstraintsAsNecessary
{
  _UIAlignedLayoutArrangement *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void (**v18)(void *, const __CFString *);
  _UIAlignedLayoutArrangement *v19;
  void *v20;
  _QWORD aBlock[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v2 = self;
  v33 = *MEMORY[0x1E0C80C00];
  -[_UIAlignedLayoutArrangement _alignmentConfigurationHistory](self, "_alignmentConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEstablishedAlignmentValues"))
  {
    -[_UILayoutArrangement _outgoingItems](v2, "_outgoingItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v19 = v2;
      v20 = v3;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[NSMutableDictionary allValues](v2->_alignmentConstraints, "allValues");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v10, "count"))
            {
              v25 = 0u;
              v26 = 0u;
              v23 = 0u;
              v24 = 0u;
              v11 = v4;
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v24;
                do
                {
                  for (j = 0; j != v13; ++j)
                  {
                    if (*(_QWORD *)v24 != v14)
                      objc_enumerationMutation(v11);
                    _UILACleanUpConstraintForItemInCollection(*(void **)(*((_QWORD *)&v23 + 1) + 8 * j), v10);
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                }
                while (v13);
              }

            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v7);
      }

      v2 = v19;
      v3 = v20;
    }
    -[_UIAlignedLayoutArrangement _alignmentPropertySource](v2, "_alignmentPropertySource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidBaselineConstraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __70___UIAlignedLayoutArrangement__removeIndividualConstraintsAsNecessary__block_invoke;
      aBlock[3] = &unk_1E16E0118;
      aBlock[4] = v2;
      v22 = v17;
      v18 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
      v18[2](v18, CFSTR("Top"));
      v18[2](v18, CFSTR("Bottom"));

    }
  }

}

- (void)_removeConstraintGroupsAsNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *alignmentConstraints;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void (**v31)(void *, const __CFString *);
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  void (**v59)(_QWORD, _QWORD);
  BOOL v60;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD aBlock[5];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  -[_UIAlignedLayoutArrangement _alignmentConfigurationHistory](self, "_alignmentConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEstablishedAlignmentValues"))
  {
    -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v46, "alignment");
    v5 = objc_msgSend(v3, "alignment");
    -[_UILayoutArrangement _outgoingItems](self, "_outgoingItems");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "axis");
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__229;
    v75 = __Block_byref_object_dispose__229;
    v76 = 0;
    if (v6 == -[_UILayoutArrangement axis](self, "axis"))
    {
      if (objc_msgSend(v44, "count"))
      {
        _constraintGroupNamesForAlignmentOptions(v5, -[_UILayoutArrangement axis](self, "axis"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        alignmentConstraints = self->_alignmentConstraints;
        objc_msgSend(v7, "anyObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](alignmentConstraints, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectEnumerator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nextObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "firstItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v44, "containsObject:", v13) & 1) != 0)
            v14 = 1;
          else
            v14 = !-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v13);
          v45 = v14;

        }
        else
        {
          v45 = 0;
        }

      }
      else
      {
        v45 = 0;
      }
    }
    else
    {
      v45 = 1;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65___UIAlignedLayoutArrangement__removeConstraintGroupsAsNecessary__block_invoke;
    aBlock[3] = &unk_1E16E95B0;
    aBlock[4] = &v71;
    v15 = _Block_copy(aBlock);
    v16 = (void (**)(_QWORD, _QWORD))v15;
    if (!(v45 & 1 | (v5 == v4)))
    {
      if ((v5 & 8) != 0 && (v4 & 8) == 0)
        (*((void (**)(void *, const __CFString *))v15 + 2))(v15, CFSTR("Top"));
      if ((v5 & 0x20) != 0 && (v4 & 0x20) == 0)
        ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Leading"));
      if ((v5 & 0x10) != 0 && (v4 & 0x10) == 0)
        ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Bottom"));
      if ((v5 & 0x40) != 0 && (v4 & 0x40) == 0)
        ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Trailing"));
      if ((v5 & 0x200) != 0 && (v4 & 0x200) == 0)
        ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("CenterX"));
      if ((v5 & 0x400) != 0 && (v4 & 0x400) == 0)
        ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("CenterY"));
      if ((v5 & 0x1000) != 0 && (v4 & 0x1000) == 0)
        ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Top"));
      if ((v5 & 0x800) != 0 && (v4 & 0x800) == 0)
        ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Bottom"));
      if ((~(_DWORD)v5 & 0x18) != 0 && (v5 & 0x60) != 0x60 && ((~(_BYTE)v4 & 0x18) == 0 || (v4 & 0x60) == 0x60))
        ((void (**)(_QWORD, const __CFString *))v16)[2](v16, CFSTR("Ambiguity Suppression"));
    }
    v17 = -[_UIAlignedLayoutArrangement _wantsConstraintsForAttribute:](self, "_wantsConstraintsForAttribute:", 12)
       || -[_UIAlignedLayoutArrangement _wantsConstraintsForAttribute:](self, "_wantsConstraintsForAttribute:", 11);
    objc_msgSend(v46, "_newlyHiddenItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    objc_msgSend(v46, "_newlyUnhiddenItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    v42 = v18;
    v43 = v20;
    -[_UILayoutArrangement _incomingItems](self, "_incomingItems");
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    v41 = v21 != 0;
    if (v23)
    {
      v24 = *(_QWORD *)v67;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v67 != v24)
            objc_enumerationMutation(v22);
          if (-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i)))
          {
            LODWORD(v23) = 1;
            goto LABEL_56;
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        if (v23)
          continue;
        break;
      }
    }
LABEL_56:
    v26 = v21 != 0;

    if ((v17 & ~v45) == 1 && (v19 != 0 || v26) | v23)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      -[_UILayoutArrangement items](self, "items");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v63;
        while (2)
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v63 != v29)
              objc_enumerationMutation(v27);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "_hasBaseline") & 1) == 0)
            {

              v55[0] = MEMORY[0x1E0C809B0];
              v55[1] = 3221225472;
              v55[2] = __65___UIAlignedLayoutArrangement__removeConstraintGroupsAsNecessary__block_invoke_2;
              v55[3] = &unk_1E16E95D8;
              v55[4] = self;
              v56 = v42;
              v59 = v16;
              v60 = v41;
              v61 = v23;
              v57 = v43;
              v58 = v22;
              v31 = (void (**)(void *, const __CFString *))_Block_copy(v55);
              v31[2](v31, CFSTR("Top"));
              v31[2](v31, CFSTR("Bottom"));

              goto LABEL_69;
            }
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
          if (v28)
            continue;
          break;
        }
      }

    }
LABEL_69:
    if (v45)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      -[NSMutableDictionary allValues](self->_alignmentConstraints, "allValues");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v78, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v52;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v52 != v34)
              objc_enumerationMutation(v32);
            _UILACleanUpConstraintsMapTable(*(void **)(*((_QWORD *)&v51 + 1) + 8 * k));
          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v78, 16);
        }
        while (v33);
      }
    }
    else
    {
      v36 = (void *)v72[5];
      if (!v36)
      {
LABEL_87:

        _Block_object_dispose(&v71, 8);
        goto LABEL_88;
      }
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v32 = v36;
      v37 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v77, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v48;
        do
        {
          for (m = 0; m != v37; ++m)
          {
            if (*(_QWORD *)v48 != v38)
              objc_enumerationMutation(v32);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_alignmentConstraints, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * m));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            _UILACleanUpConstraintsMapTable(v40);

          }
          v37 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v77, 16);
        }
        while (v37);
      }
    }

    goto LABEL_87;
  }
LABEL_88:

}

- (BOOL)_usesCenteringConnectionConstraint
{
  void *v2;
  __int16 v3;

  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alignment");

  return (v3 & 0x600) != 0;
}

- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3
{
  -[_UILayoutArrangement _setLayoutUsesCanvasMarginsWhenFilling:notify:](self, "_setLayoutUsesCanvasMarginsWhenFilling:notify:", a3, 0);
}

- (void)_clearAllConstraintsArrays
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UIAlignedLayoutArrangement;
  -[_UILayoutArrangement _clearAllConstraintsArrays](&v12, sel__clearAllConstraintsArrays);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NSMutableDictionary allValues](self->_alignmentConstraints, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        _UILACleanUpConstraintsMapTable(*(void **)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)_addIndividualConstraintsIfPossible
{
  void *v3;
  void *v4;
  int *v5;
  NSMutableDictionary *alignmentConstraints;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[_UIAlignedLayoutArrangement _alignmentConfigurationHistory](self, "_alignmentConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILayoutArrangement _incomingItems](self, "_incomingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEstablishedAlignmentValues"))
  {
    v5 = &OBJC_IVAR___UITextSearchOptions__wordMatchMethod;
    if (objc_msgSend(v4, "count"))
    {
      alignmentConstraints = self->_alignmentConstraints;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __66___UIAlignedLayoutArrangement__addIndividualConstraintsIfPossible__block_invoke;
      v42[3] = &unk_1E16E9600;
      v42[4] = self;
      v43 = v4;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](alignmentConstraints, "enumerateKeysAndObjectsUsingBlock:", v42);

    }
    if (-[_UIAlignedLayoutArrangement _wantsConstraintsForAttribute:](self, "_wantsConstraintsForAttribute:", 12)
      || -[_UIAlignedLayoutArrangement _wantsConstraintsForAttribute:](self, "_wantsConstraintsForAttribute:", 11))
    {
      v27 = v4;
      v28 = v3;
      -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _constraintGroupNamesForAlignmentOptions(objc_msgSend(v26, "alignment"), objc_msgSend(v26, "axis"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v39;
        v29 = *(_QWORD *)v39;
        v30 = v7;
        do
        {
          v11 = 0;
          v31 = v9;
          do
          {
            if (*(_QWORD *)v39 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v11);
            objc_msgSend(*(id *)((char *)&self->super.super.isa + v5[984]), "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UILayoutArrangement items](self, "items");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "count");
            if (v15 && objc_msgSend(v13, "count") < (unint64_t)(v15 - 1))
            {
              v32 = v11;
              v33 = v14;
              objc_msgSend(v13, "objectEnumerator");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "nextObject");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "firstItem");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                v36 = 0u;
                v37 = 0u;
                v34 = 0u;
                v35 = 0u;
                v19 = v33;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v35;
                  do
                  {
                    for (i = 0; i != v21; ++i)
                    {
                      if (*(_QWORD *)v35 != v22)
                        objc_enumerationMutation(v19);
                      v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                      if (v24 != v18)
                      {
                        objc_msgSend(v13, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
                        v25 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v25)
                          -[_UIAlignedLayoutArrangement _setUpConstraintForItem:referenceItem:attribute:inConstraintsTable:](self, "_setUpConstraintForItem:referenceItem:attribute:inConstraintsTable:", v24, v18, -[_UIAlignedLayoutArrangement _attributeForConstraintGroupName:](self, "_attributeForConstraintGroupName:", v12), v13);
                      }
                    }
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
                  }
                  while (v21);
                }

                v5 = &OBJC_IVAR___UITextSearchOptions__wordMatchMethod;
                v10 = v29;
                v7 = v30;
                v9 = v31;
              }

              v11 = v32;
              v14 = v33;
            }

            ++v11;
          }
          while (v11 != v9);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        }
        while (v9);
      }

      v4 = v27;
      v3 = v28;
    }
  }

}

- (void)setAxis:(int64_t)a3
{
  -[_UILayoutArrangement _setAxis:notify:](self, "_setAxis:notify:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignmentConstraints, 0);
}

- (BOOL)_spanningGuideConstraintsNeedUpdate
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIAlignedLayoutArrangement;
  if (-[_UILayoutArrangement _spanningGuideConstraintsNeedUpdate](&v8, sel__spanningGuideConstraintsNeedUpdate))
    return 1;
  -[_UIAlignedLayoutArrangement _alignmentConfigurationHistory](self, "_alignmentConfigurationHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "alignment");
  -[_UIAlignedLayoutArrangement _alignmentPropertySource](self, "_alignmentPropertySource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != objc_msgSend(v6, "alignment");

  return v3;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[NSMutableDictionary allValues](self->_alignmentConstraints, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          _UILACleanUpConstraintsMapTable(*(void **)(*((_QWORD *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)_UIAlignedLayoutArrangement;
  -[_UIAlignedLayoutArrangement dealloc](&v8, sel_dealloc);
}

- (id)_baselineDependentConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alignmentConstraints, "objectForKeyedSubscript:", CFSTR("Top"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_alignmentConstraints, "objectForKeyedSubscript:", CFSTR("Bottom"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      return 0;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alignmentConstraints, "objectForKeyedSubscript:", CFSTR("Top"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alignmentConstraints, "objectForKeyedSubscript:", CFSTR("Bottom"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIAlignedLayoutArrangement;
  -[_UILayoutArrangement description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return (NSString *)v3;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" alignmentConstraints=%p"), self->_alignmentConstraints);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
