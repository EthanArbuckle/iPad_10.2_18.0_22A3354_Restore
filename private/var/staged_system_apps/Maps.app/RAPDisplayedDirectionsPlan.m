@implementation RAPDisplayedDirectionsPlan

- (RAPDisplayedDirectionsPlan)initWithRouteCollection:(id)a3 recording:(id)a4
{
  id v7;
  id v8;
  RAPDisplayedDirectionsPlan *v9;
  RAPDisplayedDirectionsPlan *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RAPDisplayedDirectionsPlan;
  v9 = -[RAPDisplayedDirectionsPlan init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_routeCollection, a3);
    objc_storeStrong((id *)&v10->_recording, a4);
  }

  return v10;
}

- (RAPDirectionsRecording)recording
{
  return self->_recording;
}

- (int)requestedTransportType
{
  RAPDirectionsRecording *recording;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  recording = self->_recording;
  if (!recording)
    return 4;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsRequests](recording, "directionsRequests", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeAttributes"));
        v10 = objc_msgSend(v9, "hasMainTransportType");

        if ((v10 & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeAttributes"));
          v11 = objc_msgSend(v12, "mainTransportType");

          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 4;
LABEL_12:

  return v11;
}

- (NSArray)displayedRouteSuggestions
{
  return -[RouteCollection routes](self->_routeCollection, "routes");
}

- (BOOL)getRoutesIndex:(unint64_t *)a3 directionsResponseIndex:(unint64_t *)a4 forRouteSuggestion:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  id v21;
  BOOL v22;

  v8 = a5;
  v9 = objc_opt_class(GEOComposedRoute);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsResponses](self->_recording, "directionsResponses"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    while (1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsResponses](self->_recording, "directionsResponses"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v14));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "directionsResponseID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "directionsResponseID"));
      v19 = objc_msgSend(v17, "isEqualToData:", v18);

      if (v19)
        break;

      ++v14;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsResponses](self->_recording, "directionsResponses"));
      v21 = objc_msgSend(v20, "count");

      if (v14 >= (unint64_t)v21)
        goto LABEL_8;
    }
    if (a3)
      *a3 = (unint64_t)objc_msgSend(v11, "indexInResponse");
    if (a4)
      *a4 = v14;

    v22 = 1;
  }
  else
  {
LABEL_8:
    v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recording, 0);
  objc_storeStrong((id *)&self->_routeCollection, 0);
}

@end
