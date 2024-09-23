@implementation STUPresenceMetadata

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPresenceMetadata courseIdentifier](self, "courseIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUPresenceMetadata firstSeenDate](self, "firstSeenDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { courseIdentifier = %@, firstSeenDate = %@ }>"), v3, self, v4, v5));

  return v6;
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_courseIdentifier, a3);
}

- (NSDate)firstSeenDate
{
  return self->_firstSeenDate;
}

- (void)setFirstSeenDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstSeenDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstSeenDate, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
