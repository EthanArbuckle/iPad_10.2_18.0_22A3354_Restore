@implementation WiFiScanObserverNetwork

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiScanObserverNetwork;
  -[WiFiScanObserverNetwork dealloc](&v3, "dealloc");
}

- (WiFiScanObserverNetwork)initWithWiFiNetworkRef:(__WiFiNetwork *)a3
{
  WiFiScanObserverNetwork *v4;
  WiFiScanObserverNetwork *result;
  WiFiScanObserverNetwork *v6;
  const __CFArray *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSArray *v13;
  uint64_t v14;
  void *i;
  NSString *v16;
  NSString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v22.receiver = self;
  v22.super_class = (Class)WiFiScanObserverNetwork;
  v4 = -[WiFiScanObserverNetwork init](&v22, "init");
  result = 0;
  if (a3)
  {
    if (v4)
    {
      result = (WiFiScanObserverNetwork *)sub_10002B088(a3);
      v4->_SSID = (NSString *)&result->super.isa;
      if (result)
      {
        v6 = result;
        v7 = sub_10001F1E8((const __CFArray *)a3);
        v8 = sub_10001D2E0(v7);
        if (v8)
          v4->_BSSID = v8;
        v4->_scanProperties = (NSDictionary *)sub_1000173C0((uint64_t)a3);
        v9 = (void *)sub_10001D3FC(a3);
        if (v9)
        {
          v10 = v9;
          if (objc_msgSend(v9, "count"))
          {
            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
            if (v11)
            {
              v12 = v11;
              v13 = 0;
              v14 = *(_QWORD *)v19;
              do
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v19 != v14)
                    objc_enumerationMutation(v10);
                  v16 = sub_10001D2E0(*(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
                  if (v16)
                  {
                    v17 = v16;
                    if (!-[NSString isEqualToString:](v4->_BSSID, "isEqualToString:", v16))
                    {
                      if (!v13)
                        v13 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
                      -[NSArray addObject:](v13, "addObject:", v17);
                    }
                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
              }
              while (v12);
            }
            else
            {
              v13 = 0;
            }
            if (-[NSArray count](v13, "count"))
              v4->_essMembers = v13;
            else

          }
        }
        v4->_RSSI = (int)sub_10001D3D8((const __CFNumber *)a3);
        return v4;
      }
    }
  }
  return result;
}

- (NSString)description
{
  objc_class *v3;
  NSMutableString *v4;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ : %p "), NSStringFromClass(v3), self);
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("SSID='%@' "), -[WiFiScanObserverNetwork SSID](self, "SSID"));
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("BSSID='%@' "), -[WiFiScanObserverNetwork BSSID](self, "BSSID"));
  -[NSMutableString appendFormat:](v4, "appendFormat:", CFSTR("RSSI=%ld"), -[WiFiScanObserverNetwork RSSI](self, "RSSI"));
  -[NSMutableString appendString:](v4, "appendString:", CFSTR(">"));
  return &v4->super;
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (NSDictionary)scanProperties
{
  return self->_scanProperties;
}

- (NSArray)essMembers
{
  return self->_essMembers;
}

- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3
{
  return 0;
}

- (NSString)password
{
  return self->password;
}

- (int64_t)source
{
  return self->source;
}

- (NSSet)accessPoints
{
  return self->accessPoints;
}

- (NSSet)attributes
{
  return self->attributes;
}

- (TBScore)popularityScore
{
  return self->popularityScore;
}

- (TBScore)qualityScore
{
  return self->qualityScore;
}

- (BOOL)matched
{
  return self->matched;
}

- (void)setMatched:(BOOL)a3
{
  self->matched = a3;
}

- (unint64_t)type
{
  return self->type;
}

- (unint64_t)venueGroup
{
  return self->venueGroup;
}

- (unsigned)venueType
{
  return self->venueType;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setBSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setScanProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (void)setEssMembers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
