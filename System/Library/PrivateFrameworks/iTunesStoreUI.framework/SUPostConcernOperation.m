@implementation SUPostConcernOperation

- (SUPostConcernOperation)initWithConcern:(id)a3
{
  SUPostConcernOperation *v4;
  SUPostConcernOperation *v5;

  v4 = -[SUPostConcernOperation init](self, "init");
  v5 = v4;
  if (v4)
    -[SUPostConcernOperation setConcern:](v4, "setConcern:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SUPostConcernOperation setCommentText:](self, "setCommentText:", 0);
  -[SUPostConcernOperation setConcern:](self, "setConcern:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUPostConcernOperation;
  -[SUPostConcernOperation dealloc](&v3, sel_dealloc);
}

- (void)run
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  objc_msgSend(v3, "setDataProvider:", objc_msgSend(MEMORY[0x24BEC8C08], "provider"));
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setNeedsAuthentication:", 1);
  v4 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v4, "setCachePolicy:", 1);
  objc_msgSend(v4, "setHTTPBody:", -[SUPostConcernOperation _httpBody](self, "_httpBody"));
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "setURLBagKey:", CFSTR("p2-report-concern"));
  objc_msgSend(v3, "setRequestProperties:", v4);

  v5 = 0;
  if ((-[SUPostConcernOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v5) & 1) == 0)
    -[SUPostConcernOperation setError:](self, "setError:", v5);
  objc_msgSend(v3, "setDelegate:", 0);

}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("success"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "BOOLValue"))
  {
    -[SUPostConcernOperation setSuccess:](self, "setSuccess:", 1);
  }
  else if (!objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BEC8C90]))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      v13 = 138412290;
      v14 = objc_opt_class();
      LODWORD(v12) = 12;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v13, v12);
        free(v11);
        SSFileLog();
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CONCERN_POST_FAILED_ERROR"), &stru_24DE83F60, 0);
    -[SUPostConcernOperation setError:](self, "setError:", ISError());
  }
}

- (id)_httpBody
{
  id v3;
  NSString *v4;
  NSString *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = -[SUPostConcernOperation commentText](self, "commentText");
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("comments"));
  if (self->_itemIdentifier)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), self->_itemIdentifier), CFSTR("item-id"));
  v5 = -[SUConcernItem identifier](-[SUPostConcernOperation concern](self, "concern"), "identifier");
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("problem-id"));
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "queryStringForDictionary:escapedValues:", v3, 1);

  return (id)objc_msgSend(v6, "dataUsingEncoding:", 4);
}

- (NSString)commentText
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setCommentText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (SUConcernItem)concern
{
  return (SUConcernItem *)objc_getProperty(self, a2, 344, 1);
}

- (void)setConcern:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

@end
