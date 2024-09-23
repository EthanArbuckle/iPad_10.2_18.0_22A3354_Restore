@implementation TKPickerItem

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  -[TKPickerItem _appendDescriptionOfAttributesToString:](self, "_appendDescriptionOfAttributesToString:", v6);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withIntegerValue:toString:](self, "_appendDescriptionOfAttributeNamed:withIntegerValue:toString:", CFSTR("section"), -[TKPickerItem section](self, "section"), v5);
  if (-[TKPickerItem conformsToProtocol:](self, "conformsToProtocol:", &unk_254E0C610))
  {
    v4 = -[TKPickerItem numberOfChildren](self, "numberOfChildren");
    if (v4 >= 1)
      -[TKPickerItem _appendDescriptionOfAttributeNamed:withIntegerValue:toString:](self, "_appendDescriptionOfAttributeNamed:withIntegerValue:toString:", CFSTR("numberOfChildren"), v4, v5);
  }

}

- (void)_appendDescriptionOfAttributeNamed:(id)a3 withIntegerValue:(int64_t)a4 toString:(id)a5
{
  objc_msgSend(a5, "appendFormat:", CFSTR("; %@ = %ld"), a3, a4);
}

- (void)_appendDescriptionOfAttributeNamed:(id)a3 withBoolValue:(BOOL)a4 toString:(id)a5
{
  const __CFString *v5;

  v5 = CFSTR("NO");
  if (a4)
    v5 = CFSTR("YES");
  objc_msgSend(a5, "appendFormat:", CFSTR("; %@ = %@"), a3, v5);
}

- (void)_appendDescriptionOfAttributeNamed:(id)a3 withStringValue:(id)a4 toString:(id)a5
{
  objc_msgSend(a5, "appendFormat:", CFSTR("; %@ = \"%@\"), a3, a4);
}

- (int64_t)section
{
  return self->_section;
}

- (void)_setSection:(int64_t)a3
{
  self->_section = a3;
}

@end
