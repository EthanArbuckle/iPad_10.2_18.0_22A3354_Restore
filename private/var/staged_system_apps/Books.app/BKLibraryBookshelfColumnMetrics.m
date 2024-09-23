@implementation BKLibraryBookshelfColumnMetrics

+ (id)sectionName
{
  return CFSTR("column");
}

- (void)configureWithSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "floatForKey:", CFSTR("gutter"));
  -[BKLibraryBookshelfColumnMetrics setGutter:](self, "setGutter:");
  objc_msgSend(v4, "floatForKey:", CFSTR("small-gutter"));
  -[BKLibraryBookshelfColumnMetrics setSmallGutter:](self, "setSmallGutter:");
  objc_msgSend(v4, "floatForKey:", CFSTR("margins"));
  -[BKLibraryBookshelfColumnMetrics setMargins:](self, "setMargins:");
  objc_msgSend(v4, "floatForKey:", CFSTR("small-margins"));
  -[BKLibraryBookshelfColumnMetrics setSmallMargins:](self, "setSmallMargins:");
  objc_msgSend(v4, "floatForKey:", CFSTR("vertical"));
  -[BKLibraryBookshelfColumnMetrics setVertical:](self, "setVertical:");
  objc_msgSend(v4, "floatForKey:", CFSTR("max-width"));
  -[BKLibraryBookshelfColumnMetrics setMaxWidth:](self, "setMaxWidth:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapForKey:", CFSTR("width-snap")));
  -[BKLibraryBookshelfColumnMetrics setWidthSnap:](self, "setWidthSnap:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryForKey:", CFSTR("columns")));
  -[BKLibraryBookshelfColumnMetrics setColumns:](self, "setColumns:", v6);

  v7 = objc_msgSend(v4, "integerForKey:", CFSTR("small-columns"));
  -[BKLibraryBookshelfColumnMetrics setSmallColumns:](self, "setSmallColumns:", v7);
}

- (int64_t)columnsForContainingWidth:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfColumnMetrics widthSnap](self, "widthSnap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifierForValue:", a3));

  if (!v6)
    goto LABEL_5;
  v7 = objc_opt_class(NSNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfColumnMetrics columns](self, "columns"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));
  v10 = BUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11
    || (v12 = objc_opt_class(NSNumber),
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfColumnMetrics columns](self, "columns")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("*"))),
        v15 = BUDynamicCast(v12, v14),
        v11 = (void *)objc_claimAutoreleasedReturnValue(v15),
        v14,
        v13,
        v11))
  {
    v16 = (int64_t)objc_msgSend(v11, "integerValue");

  }
  else
  {
LABEL_5:
    v16 = 4;
  }

  return v16;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[BKLibraryBookshelfColumnMetrics gutter](self, "gutter");
  v4 = v3;
  -[BKLibraryBookshelfColumnMetrics margins](self, "margins");
  v6 = v5;
  -[BKLibraryBookshelfColumnMetrics vertical](self, "vertical");
  v8 = v7;
  -[BKLibraryBookshelfColumnMetrics maxWidth](self, "maxWidth");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfColumnMetrics widthSnap](self, "widthSnap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfColumnMetrics columns](self, "columns"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BKLibraryBookshelfColumnMetrics: gutter: %f, margins: %f, vertical: %f, maxWidth: %f, widthSnap: %@, columns: %@"), v4, v6, v8, v10, v11, v12));

  return (NSString *)v13;
}

- (double)gutter
{
  return self->_gutter;
}

- (void)setGutter:(double)a3
{
  self->_gutter = a3;
}

- (double)smallGutter
{
  return self->_smallGutter;
}

- (void)setSmallGutter:(double)a3
{
  self->_smallGutter = a3;
}

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (double)smallMargins
{
  return self->_smallMargins;
}

- (void)setSmallMargins:(double)a3
{
  self->_smallMargins = a3;
}

- (double)vertical
{
  return self->_vertical;
}

- (void)setVertical:(double)a3
{
  self->_vertical = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (TUISnap)widthSnap
{
  return self->_widthSnap;
}

- (void)setWidthSnap:(id)a3
{
  objc_storeStrong((id *)&self->_widthSnap, a3);
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (int64_t)smallColumns
{
  return self->_smallColumns;
}

- (void)setSmallColumns:(int64_t)a3
{
  self->_smallColumns = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_widthSnap, 0);
}

@end
