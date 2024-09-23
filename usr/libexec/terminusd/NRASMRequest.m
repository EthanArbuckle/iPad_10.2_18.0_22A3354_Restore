@implementation NRASMRequest

- (id)description
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = objc_opt_class(NRASMBrowseRequest);
  if ((objc_opt_isKindOfClass(self, v4) & 1) != 0)
  {
    v5 = CFSTR("NRASMBrowseRequest[");
  }
  else
  {
    v6 = objc_opt_class(NRASMResolveRequest);
    if ((objc_opt_isKindOfClass(self, v6) & 1) != 0)
    {
      v5 = CFSTR("NRASMResolveRequest[");
    }
    else
    {
      v7 = objc_opt_class(NRASMListenRequest);
      if ((objc_opt_isKindOfClass(self, v7) & 1) == 0)
        goto LABEL_8;
      v5 = CFSTR("NRASMListenRequest[");
    }
  }
  objc_msgSend(v3, "appendString:", v5);
LABEL_8:
  objc_msgSend(v3, "appendFormat:", CFSTR("%p, %@, %@"), self->_client, self->_identifier, self->_clientDescription);
  if (self->_localOnly)
    objc_msgSend(v3, "appendString:", CFSTR(", local"));
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_asName, 0);
  objc_storeStrong((id *)&self->_clientDescription, 0);
}

@end
