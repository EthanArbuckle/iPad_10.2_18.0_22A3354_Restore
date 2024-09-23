@implementation PPTemporalCluster

- (PPTemporalCluster)initWithEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 score:(double)a6 topics:(id)a7 entities:(id)a8 locations:(id)a9 contacts:(id)a10 contactHandles:(id)a11 mediaItems:(id)a12
{
  id v20;
  PPTemporalCluster *v21;
  PPTemporalCluster *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v24 = a11;
  v20 = a12;
  v32.receiver = self;
  v32.super_class = (Class)PPTemporalCluster;
  v21 = -[PPTemporalCluster init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_event, a3);
    objc_storeStrong((id *)&v22->_startDate, a4);
    objc_storeStrong((id *)&v22->_endDate, a5);
    v22->_score = a6;
    objc_storeStrong((id *)&v22->_topics, a7);
    objc_storeStrong((id *)&v22->_entities, a8);
    objc_storeStrong((id *)&v22->_locations, a9);
    objc_storeStrong((id *)&v22->_contacts, a10);
    objc_storeStrong((id *)&v22->_contactHandles, a11);
    objc_storeStrong((id *)&v22->_mediaItems, a12);
  }

  return v22;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  -[PPTemporalCluster descriptionDateFormatter](self, "descriptionDateFormatter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTemporalCluster startDate](self, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromDate:", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPTemporalCluster endDate](self, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromDate:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPTemporalCluster score](self, "score");
  v4 = v3;
  -[PPTemporalCluster event](self, "event");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPTemporalCluster topics](self, "topics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "count");
  -[PPTemporalCluster entities](self, "entities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[PPTemporalCluster locations](self, "locations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[PPTemporalCluster contacts](self, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[PPTemporalCluster contactHandles](self, "contactHandles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[PPTemporalCluster mediaItems](self, "mediaItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("<PPTemporalCluster st:%@ ed:%@ sc:%f et:'%@' tp:%tu ne:%tu lc:%tu ct:%tu ch:%tu mi:%tu>"), v20, v19, v4, v18, v17, v7, v9, v11, v13, objc_msgSend(v14, "count"));

  return v15;
}

- (id)longDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t ii;
  void *v77;
  PPTemporalCluster *v78;
  id obj;
  id obja;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  -[PPTemporalCluster descriptionDateFormatter](self, "descriptionDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "appendFormat:", CFSTR("=> PPTemporalCluster (%p) <="), self);
  -[PPTemporalCluster startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\nStart date: %@"), v6);

  -[PPTemporalCluster endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v3;
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\nEnd date: %@"), v8);

  -[PPTemporalCluster event](self, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\nEvent: %@"), v10);

  -[PPTemporalCluster event](self, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "suggestedEventCategory"))
  {
    -[PPTemporalCluster event](self, "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "suggestedEventCategory");

    if (!v13)
      goto LABEL_5;
    -[PPTemporalCluster event](self, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPEvent descriptionForSuggestedEventCategory:](PPEvent, "descriptionForSuggestedEventCategory:", objc_msgSend(v11, "suggestedEventCategory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" - (Suggested event, category: %@)"), v14);

  }
LABEL_5:
  -[PPTemporalCluster topics](self, "topics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n %tu Topics:"), objc_msgSend(v15, "count"));

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v78 = self;
  -[PPTemporalCluster topics](self, "topics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v102 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
        objc_msgSend(v21, "item");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "topicIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "score");
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t: %@ (score: %f)"), v23, v24);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
    }
    while (v18);
  }

  -[PPTemporalCluster entities](self, "entities");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n %tu Entities:"), objc_msgSend(v25, "count"));

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[PPTemporalCluster entities](self, "entities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v98;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v98 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
        objc_msgSend(v31, "item");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "score");
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t: %@ (score: %f)"), v33, v34);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
    }
    while (v28);
  }

  -[PPTemporalCluster locations](self, "locations");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n %tu Locations:"), objc_msgSend(v35, "count"));

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  -[PPTemporalCluster locations](self, "locations");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(id *)v94;
    obj = *(id *)v94;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(id *)v94 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * k);
        objc_msgSend(v41, "location");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "placemark");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "name");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          objc_msgSend(v43, "name");
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v43, "thoroughfare");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            objc_msgSend(v43, "thoroughfare");
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v47 = v36;
            objc_msgSend(v43, "locality");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (v48)
            {
              objc_msgSend(v43, "locality");
              v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v45 = &stru_1E226D4B0;
            }

            v36 = v47;
            v39 = obj;
          }

        }
        objc_msgSend(v41, "score");
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t: %@ (score: %f)"), v45, v49);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
    }
    while (v38);
  }

  -[PPTemporalCluster contacts](v78, "contacts");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n %tu Contacts:"), objc_msgSend(v50, "count"));

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  -[PPTemporalCluster contacts](v78, "contacts");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v90;
    do
    {
      for (m = 0; m != v52; ++m)
      {
        if (*(_QWORD *)v90 != v53)
          objc_enumerationMutation(obja);
        v55 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * m);
        objc_msgSend(v55, "contact");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "givenName");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "contact");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "familyName");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "score");
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t: %@ %@ (score: %f)"), v57, v59, v60);

      }
      v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
    }
    while (v52);
  }

  -[PPTemporalCluster contactHandles](v78, "contactHandles");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n %tu ContactHandles:"), objc_msgSend(v61, "count"));

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[PPTemporalCluster contactHandles](v78, "contactHandles");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v85, v106, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v86;
    do
    {
      for (n = 0; n != v64; ++n)
      {
        if (*(_QWORD *)v86 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * n);
        objc_msgSend(v67, "contactHandle");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "score");
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t: %@ (score: %f)"), v68, v69);

      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v85, v106, 16);
    }
    while (v64);
  }

  -[PPTemporalCluster mediaItems](v78, "mediaItems");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n %tu Related Media Items:"), objc_msgSend(v70, "count"));

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[PPTemporalCluster mediaItems](v78, "mediaItems");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v81, v105, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v82;
    do
    {
      for (ii = 0; ii != v73; ++ii)
      {
        if (*(_QWORD *)v82 != v74)
          objc_enumerationMutation(v71);
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t: %@"), *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * ii));
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v81, v105, 16);
    }
    while (v73);
  }

  objc_msgSend(v4, "appendString:", CFSTR("\n\n"));
  return v4;
}

- (id)descriptionDateFormatter
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss"));
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  void *v5;
  id v6;

  startDate = self->_startDate;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", startDate, CFSTR("st"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endDate, CFSTR("ed"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("sc"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_event, CFSTR("sd"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_topics, CFSTR("tp"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_entities, CFSTR("ne"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locations, CFSTR("lc"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contacts, CFSTR("ct"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contactHandles, CFSTR("ch"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_mediaItems, CFSTR("mi"));

}

- (PPTemporalCluster)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  PPTemporalCluster *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  PPTemporalCluster *v62;
  void *v63;
  PPTemporalCluster *v64;
  void *v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = objc_opt_class();
  pp_temporal_clusters_log_handle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("st"), v3, 1, CFSTR("PPErrorDomain"), 23, v6);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D81610];
  v8 = objc_opt_class();
  pp_temporal_clusters_log_handle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("ed"), v3, 1, CFSTR("PPErrorDomain"), 23, v9);
  v69 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D81610];
  v11 = objc_opt_class();
  pp_temporal_clusters_log_handle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("sc"), v3, 1, CFSTR("PPErrorDomain"), 23, v12);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = objc_opt_class();
  pp_temporal_clusters_log_handle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("sd"), v3, 0, CFSTR("PPErrorDomain"), 23, v15);
  v72 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D81610];
  v17 = (void *)MEMORY[0x18D7805AC]();
  v18 = objc_alloc(MEMORY[0x1E0C99E60]);
  v19 = objc_opt_class();
  v20 = (void *)objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v17);
  pp_temporal_clusters_log_handle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("tp"), v3, 1, CFSTR("PPErrorDomain"), 23, v21);
  v75 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D81610];
  v23 = (void *)MEMORY[0x18D7805AC]();
  v24 = objc_alloc(MEMORY[0x1E0C99E60]);
  v25 = objc_opt_class();
  v26 = (void *)objc_msgSend(v24, "initWithObjects:", v25, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v23);
  pp_temporal_clusters_log_handle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v26, CFSTR("ne"), v3, 1, CFSTR("PPErrorDomain"), 23, v27);
  v74 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0D81610];
  v29 = (void *)MEMORY[0x18D7805AC]();
  v30 = objc_alloc(MEMORY[0x1E0C99E60]);
  v31 = objc_opt_class();
  v32 = (void *)objc_msgSend(v30, "initWithObjects:", v31, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v29);
  pp_temporal_clusters_log_handle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v32, CFSTR("lc"), v3, 1, CFSTR("PPErrorDomain"), 23, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D81610];
  v36 = (void *)MEMORY[0x18D7805AC]();
  v37 = objc_alloc(MEMORY[0x1E0C99E60]);
  v38 = objc_opt_class();
  v39 = (void *)objc_msgSend(v37, "initWithObjects:", v38, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v36);
  pp_temporal_clusters_log_handle();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v39, CFSTR("ct"), v3, 1, CFSTR("PPErrorDomain"), 23, v40);
  v68 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x1E0D81610];
  v42 = (void *)MEMORY[0x18D7805AC]();
  v43 = objc_alloc(MEMORY[0x1E0C99E60]);
  v44 = objc_opt_class();
  v45 = (void *)objc_msgSend(v43, "initWithObjects:", v44, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v42);
  pp_temporal_clusters_log_handle();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v45, CFSTR("ch"), v3, 1, CFSTR("PPErrorDomain"), 23, v46);
  v67 = objc_claimAutoreleasedReturnValue();

  v47 = (void *)MEMORY[0x1E0D81610];
  v48 = (void *)MEMORY[0x18D7805AC]();
  v49 = objc_alloc(MEMORY[0x1E0C99E60]);
  v50 = objc_opt_class();
  v51 = (void *)objc_msgSend(v49, "initWithObjects:", v50, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v48);
  pp_temporal_clusters_log_handle();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v3;
  objc_msgSend(v47, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v51, CFSTR("mi"), v3, 1, CFSTR("PPErrorDomain"), 23, v52);
  v53 = objc_claimAutoreleasedReturnValue();

  v54 = 0;
  if (!v76)
  {
    v63 = (void *)v53;
    v55 = (void *)v69;
    v64 = self;
    v56 = v73;
LABEL_22:
    v61 = (void *)v72;
    v57 = (void *)v75;
    goto LABEL_23;
  }
  v55 = (void *)v69;
  if (!v69)
  {
    v56 = v73;
    goto LABEL_21;
  }
  v56 = v73;
  if (!v73)
  {
LABEL_21:
    v63 = (void *)v53;
    v64 = self;
    goto LABEL_22;
  }
  v57 = (void *)v75;
  if (!v75)
  {
    v63 = (void *)v53;
    v64 = self;
    v61 = (void *)v72;
LABEL_23:
    v58 = (void *)v74;
    goto LABEL_24;
  }
  v58 = (void *)v74;
  if (!v74 || !v34)
  {
    v63 = (void *)v53;
    v64 = self;
    v61 = (void *)v72;
LABEL_24:
    v60 = (void *)v67;
    v59 = (void *)v68;
    goto LABEL_25;
  }
  v59 = (void *)v68;
  if (!v68)
  {
    v63 = (void *)v53;
    v64 = self;
    v61 = (void *)v72;
    v60 = (void *)v67;
    goto LABEL_25;
  }
  v60 = (void *)v67;
  if (!v67)
  {
    v63 = (void *)v53;
    v64 = self;
    v61 = (void *)v72;
    goto LABEL_25;
  }
  if (!v53)
    goto LABEL_14;
  if (!v72)
  {
    objc_msgSend(v71, "error");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      v54 = 0;
      v55 = (void *)v69;
      v56 = v73;
LABEL_14:
      v63 = (void *)v53;
      v64 = self;
      v61 = (void *)v72;
      v58 = (void *)v74;
      v57 = (void *)v75;
      goto LABEL_25;
    }
  }
  objc_msgSend(v73, "doubleValue");
  v61 = (void *)v72;
  v55 = (void *)v69;
  v56 = v73;
  v58 = (void *)v74;
  v57 = (void *)v75;
  v62 = -[PPTemporalCluster initWithEvent:startDate:endDate:score:topics:entities:locations:contacts:contactHandles:mediaItems:](self, "initWithEvent:startDate:endDate:score:topics:entities:locations:contacts:contactHandles:mediaItems:", v72, v76, v69, v75, v74, v34, v68, v67, v53);
  v63 = (void *)v53;
  v64 = v62;
  v54 = v62;
LABEL_25:

  return v54;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)score
{
  return self->_score;
}

- (PPEvent)event
{
  return self->_event;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
