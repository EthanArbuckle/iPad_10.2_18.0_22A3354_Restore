@implementation UIIndexBarDisplayEntry

- (void)setEntryIndex:(int64_t)a3
{
  self->_entryIndex = a3;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (void)setDisplayEntryIndex:(int64_t)a3
{
  self->_displayEntryIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

- (id)description
{
  void *v3;
  UIIndexBarEntry *entry;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; entryIndex = %d"), self->_entryIndex);
  objc_msgSend(v3, "appendFormat:", CFSTR("; displayEntryIndex = %d"), self->_displayEntryIndex);
  entry = self->_entry;
  if (entry)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("; type=%d"), -[UIIndexBarEntry type](entry, "type"));
    -[UIIndexBarEntry title](self->_entry, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; title='%@'"), v5);

    -[UIIndexBarEntry shortTitle](self->_entry, "shortTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; shortTitle='%@'"), v6);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (UIIndexBarEntry)entry
{
  return self->_entry;
}

- (int64_t)entryIndex
{
  return self->_entryIndex;
}

- (int64_t)displayEntryIndex
{
  return self->_displayEntryIndex;
}

@end
