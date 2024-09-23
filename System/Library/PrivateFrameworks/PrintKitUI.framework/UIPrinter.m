@implementation UIPrinter

+ (UIPrinter)printerWithURL:(NSURL *)url
{
  NSURL *v4;
  void *v5;

  v4 = url;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithURL:", v4);

  return (UIPrinter *)v5;
}

- (id)_initWithURL:(id)a3
{
  id v5;
  UIPrinter *v6;
  UIPrinterInternals *v7;
  id printerInfo;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIPrinter;
  v6 = -[UIPrinter init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(UIPrinterInternals);
    printerInfo = v6->_printerInfo;
    v6->_printerInfo = v7;

    objc_storeStrong((id *)&v6->_url_, a3);
  }

  return v6;
}

- (id)_initWithPrinter:(id)a3
{
  id v5;
  UIPrinter *v6;
  UIPrinterInternals *v7;
  id printerInfo;
  NSURL *url;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPrinter;
  v6 = -[UIPrinter init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(UIPrinterInternals);
    printerInfo = v6->_printerInfo;
    v6->_printerInfo = v7;

    objc_storeStrong((id *)v6->_printerInfo + 1, a3);
    url = v6->_url_;
    v6->_url_ = 0;

  }
  return v6;
}

- (UIPrinter)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-[UIPrinter init] not allowed"));

  return 0;
}

- (NSURL)URL
{
  NSURL *url;
  NSURL *v4;
  NSURL *v5;

  url = self->_url_;
  if (!url)
  {
    objc_msgSend(*((id *)self->_printerInfo + 1), "printerURL");
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v5 = self->_url_;
    self->_url_ = v4;

    url = self->_url_;
  }
  return url;
}

- (NSString)displayName
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  objc_msgSend(*((id *)self->_printerInfo + 1), "displayName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E9D97C98;
  v4 = v2;

  return v4;
}

- (NSString)displayLocation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)self->_printerInfo + 1);
  if (v2)
  {
    objc_msgSend(v2, "location");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (UIPrinterJobTypes)supportedJobTypes
{
  UIPrinterJobTypes result;

  result = *((_QWORD *)self->_printerInfo + 1);
  if (result)
    return objc_msgSend((id)result, "jobTypesSupported");
  return result;
}

- (NSString)makeAndModel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)self->_printerInfo + 1);
  if (v2)
  {
    objc_msgSend(v2, "makeAndModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)supportsColor
{
  void *v3;

  v3 = (void *)*((_QWORD *)self->_printerInfo + 1);
  if (v3)
  {
    v3 = (void *)objc_msgSend(v3, "type");
    if (v3 != (void *)1)
      LOBYTE(v3) = objc_msgSend(*((id *)self->_printerInfo + 1), "type") == 3;
  }
  return (char)v3;
}

- (BOOL)supportsDuplex
{
  void *v3;

  v3 = (void *)*((_QWORD *)self->_printerInfo + 1);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "type") == 3 || objc_msgSend(*((id *)self->_printerInfo + 1), "type") == 2;
  return (char)v3;
}

- (void)contactPrinter:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  NSURL *url;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = completionHandler;
  if (v4)
    v5 = v4;
  else
    v5 = &__block_literal_global_3;
  v6 = (void *)*((_QWORD *)self->_printerInfo + 1);
  if (v6)
  {
    objc_msgSend(v6, "_checkAvailable:queue:completionHandler:", MEMORY[0x1E0C80D38], v5, 30.0);
  }
  else
  {
    url = self->_url_;
    if (url)
    {
      v8 = (void *)MEMORY[0x1E0D80A68];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __28__UIPrinter_contactPrinter___block_invoke_2;
      v9[3] = &unk_1E9D97838;
      v9[4] = self;
      v10 = v5;
      objc_msgSend(v8, "printerWithURL:discoveryTimeout:completionHandler:", url, v9, 30.0);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v5 + 2))(v5, 0);
    }
  }

}

void __28__UIPrinter_contactPrinter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  BOOL v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "set_internalPrinter:", v4);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__UIPrinter_contactPrinter___block_invoke_3;
  v5[3] = &unk_1E9D97578;
  v6 = *(id *)(a1 + 40);
  v7 = v4 != 0;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __28__UIPrinter_contactPrinter___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_internalPrinter
{
  return *((id *)self->_printerInfo + 1);
}

- (void)set_internalPrinter:(id)a3
{
  objc_storeStrong((id *)self->_printerInfo + 1, a3);
}

- (id)_printerID
{
  return (id)objc_msgSend(*((id *)self->_printerInfo + 1), "name");
}

- (void)loadPrinterInfoDict
{
  id v3;

  objc_msgSend(*((id *)self->_printerInfo + 1), "printInfoSupported");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPrinter setPrinterInfoDict:](self, "setPrinterInfoDict:", v3);

}

- (NSArray)printerFinishingOptions
{
  void *v3;
  void *v4;
  void *v5;

  if (!*((_QWORD *)self->_printerInfo + 1))
    goto LABEL_5;
  -[UIPrinter printerInfoDict](self, "printerInfoDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  -[UIPrinter printerInfoDict](self, "printerInfoDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D80AF0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {

LABEL_5:
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)finishingTemplates
{
  void *v3;
  void *v4;
  void *v5;

  if (!*((_QWORD *)self->_printerInfo + 1))
    goto LABEL_5;
  -[UIPrinter printerInfoDict](self, "printerInfoDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  -[UIPrinter printerInfoDict](self, "printerInfoDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D80AE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {

LABEL_5:
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)outputBins
{
  void *v3;
  void *v4;
  void *v5;

  if (!*((_QWORD *)self->_printerInfo + 1))
    goto LABEL_5;
  -[UIPrinter printerInfoDict](self, "printerInfoDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  -[UIPrinter printerInfoDict](self, "printerInfoDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D80B88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {

LABEL_5:
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)supportedPresets
{
  void *v3;
  void *v4;
  void *v5;

  if (*((_QWORD *)self->_printerInfo + 1)
    && (-[UIPrinter printerInfoDict](self, "printerInfoDict"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[UIPrinter printerInfoDict](self, "printerInfoDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D80B30]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)supportedTrays
{
  void *v3;
  void *v4;
  void *v5;

  if (*((_QWORD *)self->_printerInfo + 1)
    && (-[UIPrinter printerInfoDict](self, "printerInfoDict"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[UIPrinter printerInfoDict](self, "printerInfoDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D80B00]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)loadedPapers
{
  return 0;
}

- (NSArray)supportedPapers
{
  return 0;
}

- (NSArray)supportedMediaTypes
{
  void *v3;
  void *v4;
  void *v5;

  if (*((_QWORD *)self->_printerInfo + 1)
    && (-[UIPrinter printerInfoDict](self, "printerInfoDict"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[UIPrinter printerInfoDict](self, "printerInfoDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D80B58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)supportedQualities
{
  void *v3;
  void *v4;
  void *v5;

  if (*((_QWORD *)self->_printerInfo + 1)
    && (-[UIPrinter printerInfoDict](self, "printerInfoDict"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[UIPrinter printerInfoDict](self, "printerInfoDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D80BF0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (BOOL)supportsJobAccountID
{
  return objc_msgSend(*((id *)self->_printerInfo + 1), "supportsJobAccountID");
}

- (int64_t)jobAccountIDSupport
{
  return objc_msgSend(*((id *)self->_printerInfo + 1), "jobAccountIDSupport");
}

- (NSDictionary)printerInfoDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrinterInfoDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerInfoDict, 0);
  objc_storeStrong((id *)&self->_url_, 0);
  objc_storeStrong(&self->_printerInfo, 0);
}

@end
