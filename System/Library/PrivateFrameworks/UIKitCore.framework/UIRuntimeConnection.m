@implementation UIRuntimeConnection

- (UIRuntimeConnection)initWithCoder:(id)a3
{
  id v4;
  UIRuntimeConnection *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  id source;
  uint64_t v10;
  id destination;

  v4 = a3;
  v5 = -[UIRuntimeConnection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISource"));
    v8 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (id)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDestination"));
    v10 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (id)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_destination, 0);
  objc_storeStrong(&self->_source, 0);
}

- (id)destination
{
  return self->_destination;
}

- (id)source
{
  return self->_source;
}

- (NSString)label
{
  return self->_label;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *label;
  id source;
  id destination;
  id v8;

  v4 = a3;
  label = self->_label;
  v8 = v4;
  if (label)
  {
    objc_msgSend(v4, "encodeObject:forKey:", label, CFSTR("UILabel"));
    v4 = v8;
  }
  source = self->_source;
  if (source)
  {
    objc_msgSend(v8, "encodeObject:forKey:", source, CFSTR("UISource"));
    v4 = v8;
  }
  destination = self->_destination;
  if (destination)
  {
    objc_msgSend(v8, "encodeObject:forKey:", destination, CFSTR("UIDestination"));
    v4 = v8;
  }

}

- (void)setSource:(id)a3
{
  objc_storeStrong(&self->_source, a3);
}

- (void)setDestination:(id)a3
{
  objc_storeStrong(&self->_destination, a3);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
