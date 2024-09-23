@implementation SBSRelativeDisplayArrangement

- (SBSRelativeDisplayArrangement)initWithDisplayIdentifier:(id)a3 edge:(unsigned int)a4 offset:(double)a5
{
  id v9;
  SBSRelativeDisplayArrangement *v10;
  SBSRelativeDisplayArrangement *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSRelativeDisplayArrangement;
  v10 = -[SBSRelativeDisplayArrangement init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_displayIdentifier, a3);
    v11->_edge = a4;
    v11->_offset = a5;
  }

  return v11;
}

- (SBSRelativeDisplayArrangement)initWithCoder:(id)a3
{
  id v4;
  SBSRelativeDisplayArrangement *v5;
  uint64_t v6;
  NSString *displayIdentifier;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBSRelativeDisplayArrangement;
  v5 = -[SBSRelativeDisplayArrangement init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayID"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayIdentifier = v5->_displayIdentifier;
    v5->_displayIdentifier = (NSString *)v6;

    v5->_edge = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("edge"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("offset"));
    v5->_offset = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayIdentifier;
  id v5;

  displayIdentifier = self->_displayIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayIdentifier, CFSTR("displayID"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_edge, CFSTR("edge"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("offset"), self->_offset);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayIdentifier
{
  return self->_displayIdentifier;
}

- (unsigned)edge
{
  return self->_edge;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIdentifier, 0);
}

@end
