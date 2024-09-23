@implementation MOPersonRelationship

- (MOPersonRelationship)initWithRelationship:(unint64_t)a3 score:(double)a4 source:(id)a5
{
  id v8;
  MOPersonRelationship *v9;
  MOPersonRelationship *v10;
  NSString *v11;
  NSString *source;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MOPersonRelationship;
  v9 = -[MOPersonRelationship init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_relationship = a3;
    v9->_score = a4;
    v11 = (NSString *)objc_msgSend(v8, "copy");
    source = v10->_source;
    v10->_source = v11;

  }
  return v10;
}

- (id)description
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = -[MOPersonRelationship relationship](self, "relationship");
  -[MOPersonRelationship score](self, "score");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOPersonRelationship source](self, "source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOPersonRelationship relationship , %lu, score , %.1f, source, %@>"), v3, v5, v6));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t relationship;
  id v5;

  relationship = self->_relationship;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", relationship, CFSTR("relationship"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));

}

- (MOPersonRelationship)initWithCoder:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  MOPersonRelationship *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("relationship"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
  v7 = v6;
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), CFSTR("source"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[MOPersonRelationship initWithRelationship:score:source:](self, "initWithRelationship:score:source:", v5, v10, v7);
  return v11;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (double)score
{
  return self->_score;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

- (MOPersonRelationship)initWithPersonRelationshipMO:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  MOPersonRelationship *v9;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "relationship");
    objc_msgSend(v4, "score");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "source"));

    self = -[MOPersonRelationship initWithRelationship:score:source:](self, "initWithRelationship:score:source:", v5, v8, v7);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
