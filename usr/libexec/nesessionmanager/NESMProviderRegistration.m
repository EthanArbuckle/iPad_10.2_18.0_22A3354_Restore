@implementation NESMProviderRegistration

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t token;
  BOOL v8;

  v4 = a3;
  v5 = objc_opt_class(NESMProviderRegistration);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v8 = 0;
    goto LABEL_7;
  }
  if (!v4)
  {
    v6 = 0;
    if (self)
      goto LABEL_4;
LABEL_9:
    token = 0;
    goto LABEL_5;
  }
  v6 = v4[1];
  if (!self)
    goto LABEL_9;
LABEL_4:
  token = self->_token;
LABEL_5:
  v8 = v6 == token;
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdhashes, 0);
}

@end
