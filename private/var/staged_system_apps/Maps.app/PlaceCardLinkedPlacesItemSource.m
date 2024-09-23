@implementation PlaceCardLinkedPlacesItemSource

- (void)updateForPlaceCardItem:(id)a3
{
  id v4;
  GEOMapItem **p_geoMapItem;
  void *v6;
  GEOMapItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PlaceCardLinkedPlacesItem *v14;
  PlaceCardLinkedPlacesItem *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  PlaceCardLinkedPlacesItem *v26;
  void *v27;
  PlaceCardLinkedPlacesItem *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *i;
  void *v33;
  PlaceCardLinkedPlacesItem *v34;
  uint64_t v35;
  void *v36;
  _BOOL4 v37;
  PlaceCardLinkedPlacesItemSource *v38;
  NSArray *v39;
  NSArray *linkedPlaces;
  NSSet *v41;
  NSSet *linkedPlaceIdentifiers;
  void *v43;
  BOOL v44;
  id featureID;
  void *v46;
  PlaceCardLinkedPlacesItem *v47;
  id v48;
  GEOMapItem *v49;
  void *v50;
  PlaceCardLinkedPlacesItemSource *v51;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];

  v4 = a3;
  v51 = self;
  p_geoMapItem = &self->_geoMapItem;
  v49 = self->_geoMapItem;
  v50 = v4;
  if ((objc_msgSend(v4, "isCurrentLocation") & 1) != 0)
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personalizedItem"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "personalizedItem"));
    v6 = v9;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "mapItem"));

    v6 = 0;
    v7 = 0;
    v9 = v50;
    if (!v10)
      goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  v7 = (GEOMapItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));

LABEL_7:
  if (-[GEOMapItem _isTransitDisplayFeature](v7, "_isTransitDisplayFeature"))
  {

    v7 = 0;
  }
  if (v7 != *p_geoMapItem)
  {
    v46 = v6;
    objc_storeStrong((id *)p_geoMapItem, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    if (v7)
    {
      featureID = (id)v51->_featureID;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItem _identifier](v7, "_identifier"));
      v44 = v13 == 0;
      v14 = [PlaceCardLinkedPlacesItem alloc];
      if (v6)
        v15 = -[PlaceCardLinkedPlacesItem initWithPersonalizedItem:](v14, "initWithPersonalizedItem:");
      else
        v15 = -[PlaceCardLinkedPlacesItem initWithGEOMapItem:](v14, "initWithGEOMapItem:", v7);
      v47 = v15;
      v48 = (id)objc_claimAutoreleasedReturnValue(-[GEOMapItem _containedPlace](*p_geoMapItem, "_containedPlace"));
      if (v48)
      {
        objc_msgSend(v12, "addObject:", v47);
        if (v13)
          objc_msgSend(v53, "addObject:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "children"));
        v18 = objc_msgSend(v17, "count");

        if (v18)
        {
          -[PlaceCardLinkedPlacesItem setParent:](v47, "setParent:", 1);
          -[PlaceCardLinkedPlacesItem setSortOrder:](v47, "setSortOrder:", 1);
          featureID = objc_msgSend(v48, "featureId");
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "children"));
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v59;
            v22 = 2;
            do
            {
              v23 = 0;
              v24 = v13;
              do
              {
                if (*(_QWORD *)v59 != v21)
                  objc_enumerationMutation(v19);
                v25 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v23);
                v26 = -[PlaceCardLinkedPlacesItem initWithGEOMapItem:]([PlaceCardLinkedPlacesItem alloc], "initWithGEOMapItem:", v25);
                -[PlaceCardLinkedPlacesItem setSortOrder:](v26, "setSortOrder:", (char *)v23 + v22);
                -[PlaceCardLinkedPlacesItem setChild:](v26, "setChild:", 1);
                objc_msgSend(v12, "addObject:", v26);
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_identifier"));

                if (v13)
                  objc_msgSend(v53, "addObject:", v13);

                v23 = (char *)v23 + 1;
                v24 = v13;
              }
              while (v20 != v23);
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
              v22 += (uint64_t)v23;
            }
            while (v20);
          }

        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "parent"));

          if (v27)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "parent"));
            featureID = objc_msgSend(v48, "parentFeatureId");
            v28 = -[PlaceCardLinkedPlacesItem initWithGEOMapItem:]([PlaceCardLinkedPlacesItem alloc], "initWithGEOMapItem:", v43);
            -[PlaceCardLinkedPlacesItem setParent:](v28, "setParent:", 1);
            -[PlaceCardLinkedPlacesItem setSortOrder:](v28, "setSortOrder:", 1);
            objc_msgSend(v12, "addObject:", v28);
            -[PlaceCardLinkedPlacesItem setChild:](v47, "setChild:", 1);
            -[PlaceCardLinkedPlacesItem setSortOrder:](v47, "setSortOrder:", 2);
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "siblings"));
            v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v55;
              v31 = 3;
              do
              {
                for (i = 0; i != v29; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v55 != v30)
                    objc_enumerationMutation(obj);
                  v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
                  v34 = -[PlaceCardLinkedPlacesItem initWithGEOMapItem:]([PlaceCardLinkedPlacesItem alloc], "initWithGEOMapItem:", v33);

                  v28 = v34;
                  -[PlaceCardLinkedPlacesItem setSortOrder:](v34, "setSortOrder:", (char *)i + v31);
                  -[PlaceCardLinkedPlacesItem setChild:](v34, "setChild:", 1);
                  objc_msgSend(v12, "addObject:", v34);
                  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_identifier"));

                  v13 = (void *)v35;
                  if (v35)
                    objc_msgSend(v53, "addObject:", v35);
                }
                v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
                v31 += (uint64_t)i;
              }
              while (v29);
            }

          }
          else
          {
            featureID = objc_msgSend(v48, "featureId");
          }
        }
        v16 = 1;
      }
      else if (v13 && -[NSSet containsObject:](v51->_linkedPlaceIdentifiers, "containsObject:", v13))
      {
        v16 = 0;
      }
      else
      {
        featureID = 0;
        v16 = v51->_featureID != 0;
      }

      if (v44)
      {
LABEL_51:
        if (v49)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItem _identifier](v49, "_identifier"));
          v37 = v36 == 0;

          if (!v37 && !v16)
            goto LABEL_56;
        }
        else if (!v16)
        {
LABEL_56:

          v6 = v46;
          goto LABEL_57;
        }
        v38 = v51;
        objc_sync_enter(v38);
        v39 = (NSArray *)objc_msgSend(v12, "copy");
        linkedPlaces = v38->_linkedPlaces;
        v38->_linkedPlaces = v39;

        objc_sync_exit(v38);
        objc_storeStrong((id *)&v38->_containedPlace, v48);
        v51->_featureID = (unint64_t)featureID;
        v41 = (NSSet *)objc_msgSend(v53, "copy");
        linkedPlaceIdentifiers = v38->_linkedPlaceIdentifiers;
        v38->_linkedPlaceIdentifiers = v41;

        -[PersonalizedItemSource _notifyObserversItemsDidChange](v38, "_notifyObserversItemsDidChange");
        goto LABEL_56;
      }
    }
    else
    {
      v47 = 0;
      v48 = 0;
      v16 = v51->_featureID != 0;
      featureID = 0;
    }
    if (v16
      && -[NSSet isEqualToSet:](v51->_linkedPlaceIdentifiers, "isEqualToSet:", v53)
      && featureID == (id)v51->_featureID)
    {
      v16 = 0;
    }
    goto LABEL_51;
  }
LABEL_57:

}

- (id)allItems
{
  PlaceCardLinkedPlacesItemSource *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSArray copy](v2->_linkedPlaces, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)featureID
{
  return self->_featureID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedPlaceIdentifiers, 0);
  objc_storeStrong((id *)&self->_linkedPlaces, 0);
  objc_storeStrong((id *)&self->_containedPlace, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
}

@end
