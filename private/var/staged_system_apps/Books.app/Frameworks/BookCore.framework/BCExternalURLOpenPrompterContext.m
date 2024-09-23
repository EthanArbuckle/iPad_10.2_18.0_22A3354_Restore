@implementation BCExternalURLOpenPrompterContext

+ (id)sharedContextForOpening
{
  if (qword_311260 != -1)
    dispatch_once(&qword_311260, &stru_291660);
  return (id)qword_311268;
}

- (BCExternalURLOpenPrompterContext)init
{
  BCExternalURLOpenPrompterContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCExternalURLOpenPrompterContext;
  result = -[BCExternalURLOpenPrompterContext init](&v3, "init");
  if (result)
    result->_cacheResponses = 1;
  return result;
}

- (NSCache)responseCache
{
  NSCache *v3;
  NSCache *responseCache;
  _BCExternalURLOpenPrompterResponseValue *v5;
  _BCExternalURLOpenPrompterResponseValue *dummyCacheValue;

  if (self->_cacheResponses && !self->_responseCache)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    -[NSCache setTotalCostLimit:](v3, "setTotalCostLimit:", 0x100000);
    responseCache = self->_responseCache;
    self->_responseCache = v3;

    v5 = objc_alloc_init(_BCExternalURLOpenPrompterResponseValue);
    dummyCacheValue = self->_dummyCacheValue;
    self->_dummyCacheValue = v5;

  }
  return self->_responseCache;
}

- (void)setCacheResponses:(BOOL)a3
{
  NSCache *responseCache;

  if (self->_cacheResponses != a3)
  {
    self->_cacheResponses = a3;
    if (!a3)
    {
      responseCache = self->_responseCache;
      self->_responseCache = 0;

    }
  }
}

- (void)_resetResponseCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompterContext responseCache](self, "responseCache"));
  objc_msgSend(v2, "removeAllObjects");

}

- (_BCExternalURLOpenPrompterResponseValue)dummyCacheValue
{
  return self->_dummyCacheValue;
}

- (void)setDummyCacheValue:(id)a3
{
  objc_storeStrong((id *)&self->_dummyCacheValue, a3);
}

- (void)setResponseCache:(id)a3
{
  objc_storeStrong((id *)&self->_responseCache, a3);
}

- (BOOL)cacheResponses
{
  return self->_cacheResponses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCache, 0);
  objc_storeStrong((id *)&self->_dummyCacheValue, 0);
}

@end
