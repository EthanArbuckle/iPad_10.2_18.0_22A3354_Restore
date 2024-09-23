@implementation _UICommandChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandChange)initWithAnchor:(id)a3
{
  id v4;
  _UICommandChange *v5;
  uint64_t v6;
  id anchor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICommandChange;
  v5 = -[_UICommandChange init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    anchor = v5->_anchor;
    v5->_anchor = (id)v6;

  }
  return v5;
}

- (_UICommandChange)initWithCoder:(id)a3
{
  id v4;
  _UICommandChange *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id anchor;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICommandChange;
  v5 = -[_UICommandChange init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("anchor"));
    v9 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (id)v9;

  }
  return v5;
}

- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICommandDiffv1.m"), 51, CFSTR("Use concrete subclass"));

}

- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICommandDiffv1.m"), 58, CFSTR("Use concrete subclass"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_anchor, CFSTR("anchor"));
}

- (unint64_t)hash
{
  return objc_msgSend(self->_anchor, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(self->_anchor, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (id)anchor
{
  return self->_anchor;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anchor, 0);
}

@end
