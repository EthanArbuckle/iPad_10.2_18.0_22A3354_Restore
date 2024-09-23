@implementation PREditingSessionModifications

- (id)copyWithZone:(_NSZone *)a3
{
  PREditingSessionModifications *v4;
  void *v5;

  v4 = objc_alloc_init(PREditingSessionModifications);
  -[PREditingSessionModifications setContainedWidgetsBeforeEdit:](v4, "setContainedWidgetsBeforeEdit:", -[PREditingSessionModifications containedWidgetsBeforeEdit](self, "containedWidgetsBeforeEdit"));
  -[PREditingSessionModifications setColorModified:](v4, "setColorModified:", -[PREditingSessionModifications colorModified](self, "colorModified"));
  -[PREditingSessionModifications setFontModified:](v4, "setFontModified:", -[PREditingSessionModifications fontModified](self, "fontModified"));
  -[PREditingSessionModifications setNumberingSystemModified:](v4, "setNumberingSystemModified:", -[PREditingSessionModifications numberingSystemModified](self, "numberingSystemModified"));
  -[PREditingSessionModifications setPosterContentModified:](v4, "setPosterContentModified:", -[PREditingSessionModifications posterContentModified](self, "posterContentModified"));
  -[PREditingSessionModifications setWidgetsModified:](v4, "setWidgetsModified:", -[PREditingSessionModifications widgetsModified](self, "widgetsModified"));
  -[PREditingSessionModifications startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSessionModifications setStartDate:](v4, "setStartDate:", v5);

  return v4;
}

- (BOOL)containedWidgetsBeforeEdit
{
  return self->_containedWidgetsBeforeEdit;
}

- (void)setContainedWidgetsBeforeEdit:(BOOL)a3
{
  self->_containedWidgetsBeforeEdit = a3;
}

- (BOOL)colorModified
{
  return self->_colorModified;
}

- (void)setColorModified:(BOOL)a3
{
  self->_colorModified = a3;
}

- (BOOL)fontModified
{
  return self->_fontModified;
}

- (void)setFontModified:(BOOL)a3
{
  self->_fontModified = a3;
}

- (BOOL)numberingSystemModified
{
  return self->_numberingSystemModified;
}

- (void)setNumberingSystemModified:(BOOL)a3
{
  self->_numberingSystemModified = a3;
}

- (BOOL)posterContentModified
{
  return self->_posterContentModified;
}

- (void)setPosterContentModified:(BOOL)a3
{
  self->_posterContentModified = a3;
}

- (BOOL)widgetsModified
{
  return self->_widgetsModified;
}

- (void)setWidgetsModified:(BOOL)a3
{
  self->_widgetsModified = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
