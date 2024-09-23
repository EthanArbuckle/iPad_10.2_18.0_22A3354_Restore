@implementation kjAS9HuCdR1m5txL

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[kjAS9HuCdR1m5txL wgZJLy8f4tn41Pge](self, "wgZJLy8f4tn41Pge"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("eV93XIm2DFoleW67"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[kjAS9HuCdR1m5txL yOtBxuHAYKqZrNQN](self, "yOtBxuHAYKqZrNQN"), CFSTR("PVyDYKUBXCVAefL3"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[kjAS9HuCdR1m5txL qfSDGTGvqd3Hruzg](self, "qfSDGTGvqd3Hruzg"), CFSTR("unDWoRY4KcYFWF2p"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[kjAS9HuCdR1m5txL GyF0atX3JpCKc9pK](self, "GyF0atX3JpCKc9pK"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("z3Urd7zeB4LQNdm7"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[kjAS9HuCdR1m5txL JmiV9VW8P3Gxz1H7](self, "JmiV9VW8P3Gxz1H7"), CFSTR("t5wyajVqKFbSCYB6"));
}

- (kjAS9HuCdR1m5txL)initWithCoder:(id)a3
{
  id v4;
  kjAS9HuCdR1m5txL *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[8];

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)kjAS9HuCdR1m5txL;
  v5 = -[kjAS9HuCdR1m5txL init](&v12, "init");
  if (v5)
  {
    v13[0] = objc_opt_class(NSArray);
    v13[1] = objc_opt_class(NSDictionary);
    v13[2] = objc_opt_class(NSNumber);
    v13[3] = objc_opt_class(NSString);
    v13[4] = objc_opt_class(NSData);
    v13[5] = objc_opt_class(NSDate);
    v13[6] = objc_opt_class(CLLocation);
    v13[7] = objc_opt_class(PKLocation);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 8));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("eV93XIm2DFoleW67"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[kjAS9HuCdR1m5txL setWgZJLy8f4tn41Pge:](v5, "setWgZJLy8f4tn41Pge:", v9);

    -[kjAS9HuCdR1m5txL setYOtBxuHAYKqZrNQN:](v5, "setYOtBxuHAYKqZrNQN:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PVyDYKUBXCVAefL3")));
    -[kjAS9HuCdR1m5txL setQfSDGTGvqd3Hruzg:](v5, "setQfSDGTGvqd3Hruzg:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("unDWoRY4KcYFWF2p")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("z3Urd7zeB4LQNdm7")));
    -[kjAS9HuCdR1m5txL setGyF0atX3JpCKc9pK:](v5, "setGyF0atX3JpCKc9pK:", v10);

    -[kjAS9HuCdR1m5txL setJmiV9VW8P3Gxz1H7:](v5, "setJmiV9VW8P3Gxz1H7:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t5wyajVqKFbSCYB6")));
  }

  return v5;
}

+ (id)cR9LfsxC1Nz4IZKu
{
  return -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", &__NSArray0__struct, 149);
}

+ (id)Xw2iAzNBHudJx7Ph:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  NSSet *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  kjAS9HuCdR1m5txL *v27;
  kjAS9HuCdR1m5txL *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v3, 3);

  v5 = objc_opt_class(kjAS9HuCdR1m5txL);
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(NSDictionary), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v35 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v7, v4, &v35));
  v9 = v35;
  if (v9)
  {
    v10 = v9;
    v11 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D854C((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    v34 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 0, 0, &v34));
    v19 = v34;

    if (v19)
    {
      v20 = qword_1005185D0;
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
        sub_1003D84E8((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
      v27 = 0;
    }
    else
    {
      v29 = [kjAS9HuCdR1m5txL alloc];
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Yaq6qLPClqGRAXCx")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("iVmTzX1ymXOWRKrv")));
      v27 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v29, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v30, objc_msgSend(v31, "integerValue"));

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("14ornzG9W3NaJVpK")));
      -[kjAS9HuCdR1m5txL setYOtBxuHAYKqZrNQN:](v27, "setYOtBxuHAYKqZrNQN:", objc_msgSend(v32, "integerValue"));

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("mYBuACT5pLzJb26c")));
      -[kjAS9HuCdR1m5txL setWgZJLy8f4tn41Pge:](v27, "setWgZJLy8f4tn41Pge:", v33);

    }
  }
  else
  {
    v27 = v8;
  }

  return v27;
}

- (kjAS9HuCdR1m5txL)initWithGyF0atX3JpCKc9pK:(id)a3 qfSDGTGvqd3Hruzg:(int64_t)a4
{
  objc_storeStrong((id *)&self->_GyF0atX3JpCKc9pK, a3);
  self->_qfSDGTGvqd3Hruzg = a4;
  self->_yOtBxuHAYKqZrNQN = 0;
  self->_JmiV9VW8P3Gxz1H7 = -1;
  return self;
}

- (id)serializeDataframeWithSecureCoding
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12));
  v3 = v12;
  if (v3)
  {
    v4 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D85B0((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  return v2;
}

- (id)lL9A0cjB5y6UgZsI
{
  return -[kjAS9HuCdR1m5txL serializeDataframeWithSecureCoding](self, "serializeDataframeWithSecureCoding");
}

- (BOOL)rEI50SHLlVc37Bvu
{
  return !self->_qfSDGTGvqd3Hruzg && self->_GyF0atX3JpCKc9pK != 0;
}

- (NSArray)GyF0atX3JpCKc9pK
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGyF0atX3JpCKc9pK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)qfSDGTGvqd3Hruzg
{
  return self->_qfSDGTGvqd3Hruzg;
}

- (void)setQfSDGTGvqd3Hruzg:(int64_t)a3
{
  self->_qfSDGTGvqd3Hruzg = a3;
}

- (int64_t)yOtBxuHAYKqZrNQN
{
  return self->_yOtBxuHAYKqZrNQN;
}

- (void)setYOtBxuHAYKqZrNQN:(int64_t)a3
{
  self->_yOtBxuHAYKqZrNQN = a3;
}

- (NSDate)wgZJLy8f4tn41Pge
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWgZJLy8f4tn41Pge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)JmiV9VW8P3Gxz1H7
{
  return self->_JmiV9VW8P3Gxz1H7;
}

- (void)setJmiV9VW8P3Gxz1H7:(unint64_t)a3
{
  self->_JmiV9VW8P3Gxz1H7 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wgZJLy8f4tn41Pge, 0);
  objc_storeStrong((id *)&self->_GyF0atX3JpCKc9pK, 0);
}

@end
