@implementation CRVectorTimestampElement

- (int64_t)rem_compareToVectorTimestampElement:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v10;

  v4 = a3;
  v5 = -[CRVectorTimestampElement clock](self, "clock");
  if (v5 < objc_msgSend(v4, "clock"))
  {
LABEL_5:
    v7 = -1;
    goto LABEL_6;
  }
  v6 = -[CRVectorTimestampElement clock](self, "clock");
  if (v6 <= objc_msgSend(v4, "clock"))
  {
    v8 = -[CRVectorTimestampElement subclock](self, "subclock");
    if (v8 >= objc_msgSend(v4, "subclock"))
    {
      v10 = -[CRVectorTimestampElement subclock](self, "subclock");
      v7 = v10 > objc_msgSend(v4, "subclock");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v7 = 1;
LABEL_6:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRVectorTimestampElement)initWithCoder:(id)a3
{
  id v4;
  CRVectorTimestampElement *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRVectorTimestampElement;
  v5 = -[CRVectorTimestampElement init](&v7, sel_init);
  if (v5)
  {
    -[CRVectorTimestampElement setClock:](v5, "setClock:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("clock")));
    -[CRVectorTimestampElement setSubclock:](v5, "setSubclock:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("subclock")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[CRVectorTimestampElement clock](self, "clock"), CFSTR("clock"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[CRVectorTimestampElement subclock](self, "subclock"), CFSTR("subclock"));

}

- (unint64_t)clock
{
  return self->_clock;
}

- (void)setClock:(unint64_t)a3
{
  self->_clock = a3;
}

- (unint64_t)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unint64_t)a3
{
  self->_subclock = a3;
}

@end
