@implementation _DUIPotentialDrop

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIPotentialDrop)init
{
  _DUIPotentialDrop *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DUIPotentialDrop;
  result = -[_DUIPotentialDrop init](&v3, sel_init);
  if (result)
    result->_operation = 0;
  return result;
}

- (_DUIPotentialDrop)initWithCoder:(id)a3
{
  id v4;
  _DUIPotentialDrop *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_DUIPotentialDrop;
  v5 = -[_DUIPotentialDrop init](&v7, sel_init);
  if (v5)
  {
    v5->_operation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operation"));
    v5->_forbidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forbidden"));
    v5->_precise = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("precise"));
    v5->_prefersFullSizePreview = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersFullSizePreview"));
    v5->_preferredBadgeStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredBadgeStyle"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t operation;
  id v5;

  operation = self->_operation;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", operation, CFSTR("operation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forbidden, CFSTR("forbidden"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_precise, CFSTR("precise"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_prefersFullSizePreview, CFSTR("prefersFullSizePreview"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredBadgeStyle, CFSTR("preferredBadgeStyle"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: operation=%ld forbidden=%d precise=%d prefersFullSizePreview=%d preferredBadgeStyle=%ld>"), objc_opt_class(), self, self->_operation, self->_forbidden, self->_precise, self->_prefersFullSizePreview, self->_preferredBadgeStyle);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  int64_t v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_DUIPotentialDrop operation](self, "operation");
    if (v6 == objc_msgSend(v5, "operation")
      && (v7 = -[_DUIPotentialDrop forbidden](self, "forbidden"), v7 == objc_msgSend(v5, "forbidden"))
      && (v8 = -[_DUIPotentialDrop precise](self, "precise"), v8 == objc_msgSend(v5, "precise"))
      && (v9 = -[_DUIPotentialDrop prefersFullSizePreview](self, "prefersFullSizePreview"),
          v9 == objc_msgSend(v5, "prefersFullSizePreview")))
    {
      v12 = -[_DUIPotentialDrop preferredBadgeStyle](self, "preferredBadgeStyle");
      v10 = v12 == objc_msgSend(v5, "preferredBadgeStyle");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setOperation:", -[_DUIPotentialDrop operation](self, "operation"));
  objc_msgSend(v4, "setForbidden:", -[_DUIPotentialDrop forbidden](self, "forbidden"));
  objc_msgSend(v4, "setPrecise:", -[_DUIPotentialDrop precise](self, "precise"));
  objc_msgSend(v4, "setPrefersFullSizePreview:", -[_DUIPotentialDrop prefersFullSizePreview](self, "prefersFullSizePreview"));
  objc_msgSend(v4, "setPreferredBadgeStyle:", -[_DUIPotentialDrop preferredBadgeStyle](self, "preferredBadgeStyle"));
  return v4;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (BOOL)forbidden
{
  return self->_forbidden;
}

- (void)setForbidden:(BOOL)a3
{
  self->_forbidden = a3;
}

- (BOOL)precise
{
  return self->_precise;
}

- (void)setPrecise:(BOOL)a3
{
  self->_precise = a3;
}

- (BOOL)prefersFullSizePreview
{
  return self->_prefersFullSizePreview;
}

- (void)setPrefersFullSizePreview:(BOOL)a3
{
  self->_prefersFullSizePreview = a3;
}

- (int64_t)preferredBadgeStyle
{
  return self->_preferredBadgeStyle;
}

- (void)setPreferredBadgeStyle:(int64_t)a3
{
  self->_preferredBadgeStyle = a3;
}

@end
