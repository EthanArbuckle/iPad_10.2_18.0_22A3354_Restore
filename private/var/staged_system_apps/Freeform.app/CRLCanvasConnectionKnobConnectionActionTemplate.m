@implementation CRLCanvasConnectionKnobConnectionActionTemplate

- (CRLCanvasConnectionKnobConnectionActionTemplate)initWithRepForConnecting:(id)a3 andRepsForDragging:(id)a4
{
  id v7;
  id v8;
  CRLCanvasConnectionKnobConnectionActionTemplate *v9;
  CRLCanvasConnectionKnobConnectionActionTemplate *v10;
  NSMutableSet *v11;
  NSMutableSet *repAccessibilitiesForDragging;
  uint64_t v13;
  NSMutableDictionary *occludingRepAccessibilitiesByUUID;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CRLCanvasConnectionKnobConnectionActionTemplate;
  v9 = -[CRLCanvasConnectionKnobConnectionActionTemplate init](&v31, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_repAXForConnecting, a3);
    v25 = v8;
    v26 = v7;
    if (v8)
      v11 = (NSMutableSet *)v8;
    else
      v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    repAccessibilitiesForDragging = v10->_repAccessibilitiesForDragging;
    v10->_repAccessibilitiesForDragging = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", -[NSMutableSet count](v10->_repAccessibilitiesForDragging, "count")));
    occludingRepAccessibilitiesByUUID = v10->_occludingRepAccessibilitiesByUUID;
    v10->_occludingRepAccessibilitiesByUUID = (NSMutableDictionary *)v13;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v10->_repAccessibilitiesForDragging;
    v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "crlaxTarget", v25, v26, (_QWORD)v27));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layout"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:](CRLCanvasRepAccessibility, "crlaxBoardItemIDForLayout:", v21));

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_occludingRepAccessibilitiesByUUID, "setObject:forKeyedSubscript:", v23, v22);

          }
        }
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v17);
    }

    v8 = v25;
    v7 = v26;
  }

  return v10;
}

- (CRLCanvasRepAccessibility)repAXForConnecting
{
  return self->_repAXForConnecting;
}

- (void)setRepAXForConnecting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableSet)repAccessibilitiesForDragging
{
  return self->_repAccessibilitiesForDragging;
}

- (void)setRepAccessibilitiesForDragging:(id)a3
{
  objc_storeStrong((id *)&self->_repAccessibilitiesForDragging, a3);
}

- (NSMutableDictionary)occludingRepAccessibilitiesByUUID
{
  return self->_occludingRepAccessibilitiesByUUID;
}

- (void)setOccludingRepAccessibilitiesByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_occludingRepAccessibilitiesByUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occludingRepAccessibilitiesByUUID, 0);
  objc_storeStrong((id *)&self->_repAccessibilitiesForDragging, 0);
  objc_storeStrong((id *)&self->_repAXForConnecting, 0);
}

@end
