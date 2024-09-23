@implementation SWCPattern

void __71___SWCPattern_Private___debug_descriptionOfStorage_forObject_redacted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  const __CFString *v5;
  CFTypeID TypeID;
  const __CFString *v7;
  __CFString *cf;
  __CFString *cfa;

  cf = a3;
  if (_NSIsNSDictionary())
  {
    v4 = -[__CFString count](cf, "count");
    if (v4)
    {
      if (v4 == 1)
        v5 = CFSTR("{ <private> }");
      else
        v5 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{ <private> * %llu }"), v4);
    }
    else
    {
      v5 = CFSTR("{ }");
    }
    goto LABEL_10;
  }
  TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(cf))
  {
    v5 = CFSTR("<private>");
LABEL_10:

    v7 = v5;
    goto LABEL_11;
  }
  v7 = cf;
LABEL_11:
  cfa = (__CFString *)v7;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

}

@end
