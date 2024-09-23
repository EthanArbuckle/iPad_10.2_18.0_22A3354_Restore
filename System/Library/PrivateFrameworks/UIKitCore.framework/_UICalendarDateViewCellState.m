@implementation _UICalendarDateViewCellState

- (_UICalendarDateViewCellState)initWithTraits:(id)a3
{
  id v5;
  _UICalendarDateViewCellState *v6;
  _UICalendarDateViewCellState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICalendarDateViewCellState;
  v6 = -[_UICalendarDateViewCellState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_traits, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _BOOL4 v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[_UICalendarDateViewCellState highlightsToday](self, "highlightsToday"),
        v5 == objc_msgSend(v4, "highlightsToday"))
    && (v6 = -[_UICalendarDateViewCellState isOutOfRange](self, "isOutOfRange"),
        v6 == objc_msgSend(v4, "isOutOfRange"))
    && (v7 = -[_UICalendarDateViewCellState isOverhangMonth](self, "isOverhangMonth"),
        v7 == objc_msgSend(v4, "isOverhangMonth"))
    && (v8 = -[_UICalendarDateViewCellState isToday](self, "isToday"), v8 == objc_msgSend(v4, "isToday"))
    && (v9 = -[_UICalendarDateViewCellState isSelected](self, "isSelected"),
        v9 == objc_msgSend(v4, "isSelected"))
    && (v10 = -[_UICalendarDateViewCellState isHighlighted](self, "isHighlighted"),
        v10 == objc_msgSend(v4, "isHighlighted")))
  {
    v13 = -[_UICalendarDateViewCellState forceEmphasizedFont](self, "forceEmphasizedFont");
    v11 = v13 ^ objc_msgSend(v4, "forceEmphasizedFont") ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;

  if (-[_UICalendarDateViewCellState highlightsToday](self, "highlightsToday"))
    v3 = 2;
  else
    v3 = 0;
  v4 = -[_UICalendarDateViewCellState isOutOfRange](self, "isOutOfRange");
  v5 = 4;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[_UICalendarDateViewCellState isOverhangMonth](self, "isOverhangMonth"))
    v7 = 8;
  else
    v7 = 0;
  v8 = -[_UICalendarDateViewCellState isToday](self, "isToday");
  v9 = 16;
  if (!v8)
    v9 = 0;
  v10 = v6 | v7 | v9;
  if (-[_UICalendarDateViewCellState isSelected](self, "isSelected"))
    v11 = 32;
  else
    v11 = 0;
  v12 = -[_UICalendarDateViewCellState isHighlighted](self, "isHighlighted");
  v13 = 64;
  if (!v12)
    v13 = 0;
  v14 = v11 | v13;
  v15 = -[_UICalendarDateViewCellState forceEmphasizedFont](self, "forceEmphasizedFont");
  v16 = 128;
  if (!v15)
    v16 = 0;
  return v10 | v14 | v16;
}

- (UITraitCollection)traits
{
  return self->_traits;
}

- (BOOL)isOutOfRange
{
  return self->_outOfRange;
}

- (void)setOutOfRange:(BOOL)a3
{
  self->_outOfRange = a3;
}

- (BOOL)isOverhangMonth
{
  return self->_overhangMonth;
}

- (void)setOverhangMonth:(BOOL)a3
{
  self->_overhangMonth = a3;
}

- (BOOL)highlightsToday
{
  return self->_highlightsToday;
}

- (void)setHighlightsToday:(BOOL)a3
{
  self->_highlightsToday = a3;
}

- (BOOL)isToday
{
  return self->_today;
}

- (void)setToday:(BOOL)a3
{
  self->_today = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)forceEmphasizedFont
{
  return self->_forceEmphasizedFont;
}

- (void)setForceEmphasizedFont:(BOOL)a3
{
  self->_forceEmphasizedFont = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
