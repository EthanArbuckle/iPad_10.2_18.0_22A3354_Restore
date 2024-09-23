@implementation CRLayoutListItem

- (CRLayoutListItem)initWithGroup:(id)a3
{
  id v4;
  CRLayoutListItem *v5;
  void *v6;
  void *v7;
  CRLayoutListItem *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLayoutListItem;
  v5 = -[CRLayoutListItem init](&v12, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRListItemMarker listItemMarkerForText:requiresAdjacentText:](CRListItemMarker, "listItemMarkerForText:requiresAdjacentText:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRLayoutListItem setMarker:](v5, "setMarker:", v7);

  -[CRLayoutListItem marker](v5, "marker");
  v8 = (CRLayoutListItem *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRLayoutListItem setGroups:](v5, "setGroups:", v9);

    objc_msgSend(v4, "boundingQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRLayoutListItem setUnionBoundingQuad:](v5, "setUnionBoundingQuad:", v10);

LABEL_4:
    v8 = v5;
  }

  return v8;
}

- (void)appendGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  id v22;

  v4 = a3;
  -[CRLayoutListItem groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRLayoutListItem setGroups:](self, "setGroups:", v6);

  -[CRLayoutListItem unionBoundingQuad](self, "unionBoundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baselineAngle");
  v9 = v8;
  objc_msgSend(v4, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "baselineAngle");
  v12 = v11;
  -[CRLayoutListItem groups](self, "groups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v15 = v9 - v12;
  if (v9 - v12 <= 3.14159265)
  {
    if (v15 > -3.14159265)
      goto LABEL_6;
    v16 = 6.28318531;
  }
  else
  {
    v16 = -6.28318531;
  }
  v15 = v15 + v16;
LABEL_6:
  v17 = v12 + v15 * (float)(1.0 / (float)v14);
  if (v17 > 3.14159265)
  {
    v18 = -6.28318531;
LABEL_10:
    v17 = v17 + v18;
    goto LABEL_11;
  }
  if (v17 <= -3.14159265)
  {
    v18 = 6.28318531;
    goto LABEL_10;
  }
LABEL_11:

  -[CRLayoutListItem unionBoundingQuad](self, "unionBoundingQuad");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingQuad");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v20 = v17;
  objc_msgSend(v22, "unionWithNormalizedQuad:baselineAngle:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRLayoutListItem setUnionBoundingQuad:](self, "setUnionBoundingQuad:", v21);

}

- (BOOL)canBeSucceededByListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRLayoutListItem marker](self, "marker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "canBeSucceededByMarker:", v6);
  return (char)v4;
}

- (_NSRange)markerRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CRLayoutListItem marker](self, "marker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (int64_t)markerType
{
  void *v2;
  int64_t v3;

  -[CRLayoutListItem marker](self, "marker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (NSArray)groups
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CRNormalizedQuad)unionBoundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUnionBoundingQuad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRListItemMarker)marker
{
  return (CRListItemMarker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMarker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
  objc_storeStrong((id *)&self->_unionBoundingQuad, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end
