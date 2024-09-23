@implementation BKDirectTouchPerDisplayInfo

- (void)dealloc
{
  BKDigitizerTouchStreamAggregate *touchStreams;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  touchStreams = self->_touchStreams;
  if (touchStreams)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = -[NSMutableArray copy](touchStreams->_clients, "copy");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          sub_10008C60C(*(id **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)BKDirectTouchPerDisplayInfo;
  -[BKDirectTouchPerDisplayInfo dealloc](&v9, "dealloc");
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "appendProem:block:", self, &stru_1000E9880);
  v4 = sub_10000C210((id *)&self->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v9, "appendObject:withName:", v5, CFSTR("digitizers"));

  v7 = objc_msgSend(v9, "appendObject:withName:", self->_touchStreams, CFSTR("touchStreams"));
  v8 = objc_msgSend(v9, "appendObject:withName:", self->_hitTestRegions, CFSTR("hitTestRegions"));

}

- (NSMutableDictionary)serviceToDigitizer
{
  return self->_serviceToDigitizer;
}

- (void)setServiceToDigitizer:(id)a3
{
  objc_storeStrong((id *)&self->_serviceToDigitizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToDigitizer, 0);
  objc_storeStrong((id *)&self->_cachedServiceProperties, 0);
  objc_storeStrong((id *)&self->_hitTestRegions, 0);
  objc_storeStrong((id *)&self->_touchStreams, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
}

@end
