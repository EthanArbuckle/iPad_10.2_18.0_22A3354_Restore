@implementation RouteMarkerFormatterInfo

- (RouteMarkerFormatterInfo)initWithRouteDescription:(id)a3 etaComparison:(unsigned __int8)a4 tollCurrency:(unsigned __int8)a5 styleAttributes:(id)a6
{
  return -[RouteMarkerFormatterInfo initWithRouteDescription:etaType:etaComparison:tollCurrency:styleAttributes:](self, "initWithRouteDescription:etaType:etaComparison:tollCurrency:styleAttributes:", a3, 0, a4, a5, a6);
}

- (RouteMarkerFormatterInfo)initWithRouteDescription:(id)a3 etaType:(int64_t)a4 etaComparison:(unsigned __int8)a5 tollCurrency:(unsigned __int8)a6 styleAttributes:(id)a7
{
  id v12;
  id v13;
  RouteMarkerFormatterInfo *v14;
  NSString *v15;
  NSString *routeDescription;
  objc_super v18;

  v12 = a3;
  v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)RouteMarkerFormatterInfo;
  v14 = -[RouteMarkerFormatterInfo init](&v18, "init");
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v12, "copy");
    routeDescription = v14->_routeDescription;
    v14->_routeDescription = v15;

    v14->_etaType = a4;
    v14->_etaComparison = a5;
    v14->_tollCurrency = a6;
    objc_storeStrong((id *)&v14->_styleAttributes, a7);
  }

  return v14;
}

- (id)description
{
  NSMutableString *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(self), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  v6 = CFSTR("VKExitSign");
  switch(self->_etaType)
  {
    case 0:
      goto LABEL_9;
    case 1:
      goto LABEL_8;
    case 2:
      v6 = CFSTR("VKTrafficDelay");
      goto LABEL_8;
    case 3:
      v6 = CFSTR("VKRouteLegEta");
      goto LABEL_8;
    case 4:
      v6 = CFSTR("VKRouteName");
      goto LABEL_8;
    case 5:
      v6 = CFSTR("VKTravelDirection");
      goto LABEL_8;
    case 6:
      v6 = CFSTR("VKDebugAnnotation");
      goto LABEL_8;
    default:
      v6 = CFSTR("VKRouteEtaUnknown");
LABEL_8:
      objc_msgSend(v4, "appendFormat:", CFSTR(", etaType: %@"), v6);
LABEL_9:
      v7 = CFSTR("Same");
      switch(self->_etaComparison)
      {
        case 0u:
          goto LABEL_14;
        case 1u:
          goto LABEL_13;
        case 2u:
          v7 = CFSTR("Slower");
          goto LABEL_13;
        case 3u:
          v7 = CFSTR("Faster");
          goto LABEL_13;
        default:
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VKEtaComparison (%u)"), self->_etaComparison));
LABEL_13:
          objc_msgSend(v5, "appendFormat:", CFSTR(", etaComparison: %@"), v7);

LABEL_14:
          v8 = CFSTR("Usd");
          switch(self->_tollCurrency)
          {
            case 0u:
              goto LABEL_23;
            case 1u:
              goto LABEL_22;
            case 2u:
              v8 = CFSTR("Yen");
              goto LABEL_22;
            case 3u:
              v8 = CFSTR("Euro");
              goto LABEL_22;
            case 4u:
              v8 = CFSTR("Pound");
              goto LABEL_22;
            case 5u:
              v8 = CFSTR("Won");
              goto LABEL_22;
            case 6u:
              v8 = CFSTR("Rupee");
              goto LABEL_22;
            case 7u:
              v8 = CFSTR("Ruble");
              goto LABEL_22;
            default:
              v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VKEtaTollCurrencyType (%u)"), self->_tollCurrency));
LABEL_22:
              objc_msgSend(v5, "appendFormat:", CFSTR(", tollCurrency: %@"), v8);

LABEL_23:
              v9 = CFSTR("YES");
              if (!self->_styleAttributes)
                v9 = CFSTR("NO");
              objc_msgSend(v5, "appendFormat:", CFSTR(", hasStyleAttributes: %@, routeDescription: %@>"), v9, self->_routeDescription);
              return v5;
          }
      }
  }
}

- (NSString)routeDescription
{
  return self->_routeDescription;
}

- (int64_t)etaType
{
  return self->_etaType;
}

- (unsigned)etaComparison
{
  return self->_etaComparison;
}

- (unsigned)tollCurrency
{
  return self->_tollCurrency;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_routeDescription, 0);
}

@end
