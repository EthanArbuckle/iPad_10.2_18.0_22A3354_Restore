@implementation TAMetricsVisit

- (TAMetricsVisit)initWithSnapshotHistory:(id)a3 andAddress:(id)a4 andVisitFilterSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  TAMetricsVisit *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int64x2_t v32;
  int64x2_t v33;
  int64x2_t v34;
  void *v35;
  TALocationLite *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  TALocationLite *v47;
  void *v48;
  TALocationLite *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  TALocationLite *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BOOL4 v78;
  uint64_t i;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v88;
  id v89;
  TALocationLite *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  id obj;
  _QWORD *v97;
  uint64_t v98;
  _BOOL4 v99;
  int v100;
  TALocationLite *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  objc_super v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v110.receiver = self;
  v110.super_class = (Class)TAMetricsVisit;
  v11 = -[TAMetricsVisit init](&v110, sel_init);
  if (!v11)
  {
LABEL_41:
    v12 = (TAMetricsVisit *)v11;
    goto LABEL_44;
  }
  v12 = 0;
  if (v8 && v9 && v10)
  {
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "isClosed"))
        {
          objc_msgSend(v14, "latestUtAdvertisements");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = objc_msgSend(v9, "copy");
            v18 = (void *)*((_QWORD *)v11 + 1);
            *((_QWORD *)v11 + 1) = v17;

            objc_msgSend(v14, "representativeVisit");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "coordinate");
            *((_QWORD *)v11 + 10) = v20;

            objc_msgSend(v14, "representativeVisit");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "coordinate");
            *((_QWORD *)v11 + 11) = v22;

            objc_msgSend(v14, "getArrivalDelay");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)*((_QWORD *)v11 + 8);
            *((_QWORD *)v11 + 8) = v23;

            objc_msgSend(v14, "getDepartureDelay");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)*((_QWORD *)v11 + 9);
            *((_QWORD *)v11 + 9) = v25;

            objc_msgSend(v10, "entryDisplayOnBudget");
            objc_msgSend(v14, "getDurationOfVisitEntryConsideredWithDisplayOnBudget:");
            *((_QWORD *)v11 + 6) = v27;
            objc_msgSend(v10, "exitDisplayOnBudget");
            objc_msgSend(v14, "getDurationOfVisitExitConsideredWithDisplayOnBudget:");
            *((_QWORD *)v11 + 7) = v28;
            objc_msgSend(v14, "latestUtAdvertisements");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v9;
            objc_msgSend(v29, "objectForKey:", v9);
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)*((_QWORD *)v11 + 13);
            *((_QWORD *)v11 + 13) = v30;

            v32 = vdupq_n_s64(1uLL);
            v33 = vaddq_s64(*((int64x2_t *)v11 + 1), v32);
            v34 = vaddq_s64(*((int64x2_t *)v11 + 2), v32);
            *((int64x2_t *)v11 + 1) = v33;
            *((int64x2_t *)v11 + 2) = v34;
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = [TALocationLite alloc];
            objc_msgSend(v14, "representativeVisit");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "getDate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "representativeVisit");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "coordinate");
            v41 = v40;
            objc_msgSend(v14, "representativeVisit");
            v97 = v11;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "coordinate");
            v44 = v43;
            objc_msgSend(v14, "representativeVisit");
            v94 = v14;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "horizontalAccuracy");
            v47 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v36, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v38, v41, v44, v46);

            v48 = v14;
            v11 = v97;

            v91 = v35;
            objc_msgSend(v35, "addObject:", v47);
            v49 = v47;
            v106 = 0u;
            v107 = 0u;
            v108 = 0u;
            v109 = 0u;
            v89 = v8;
            objc_msgSend(v8, "reverseObjectEnumerator");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
            v90 = v49;
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v107;
              v53 = 1;
              LODWORD(v54) = 1;
              v93 = *(_QWORD *)v107;
              do
              {
                v55 = 0;
                v101 = v49;
                v95 = v51;
                do
                {
                  if (*(_QWORD *)v107 != v52)
                    objc_enumerationMutation(obj);
                  v56 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v55);
                  if ((objc_msgSend(v56, "isEqual:", v48) & 1) != 0)
                  {
                    v49 = v101;
                  }
                  else
                  {
                    v98 = v53;
                    v100 = v54;
                    v57 = [TALocationLite alloc];
                    objc_msgSend(v56, "representativeVisit");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "getDate");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "representativeVisit");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "coordinate");
                    v62 = v61;
                    objc_msgSend(v56, "representativeVisit");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "coordinate");
                    v65 = v64;
                    objc_msgSend(v56, "representativeVisit");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "horizontalAccuracy");
                    v49 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:](v57, "initWithTimestamp:latitude:longitude:horizontalAccuracy:", v59, v62, v65, v67);

                    v11 = v97;
                    v68 = objc_msgSend(v10, "minNSigmaBetweenVisits");
                    objc_msgSend(v10, "minInterVisitDistance");
                    v99 = +[TALocationLite distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:](TALocationLite, "distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:", v49, v101, v68);
                    objc_msgSend(v56, "latestUtAdvertisements");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "objectForKey:", v97[1]);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v70)
                    {
                      if (!v97[12])
                      {
                        v71 = objc_alloc(MEMORY[0x24BDD16E0]);
                        -[TALocationLite distanceFromLocation:](v90, "distanceFromLocation:", v49);
                        v72 = objc_msgSend(v71, "initWithDouble:");
                        v73 = (void *)v97[12];
                        v97[12] = v72;

                      }
                      v104 = 0u;
                      v105 = 0u;
                      v102 = 0u;
                      v103 = 0u;
                      v74 = v91;
                      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
                      if (v75)
                      {
                        v76 = v75;
                        v92 = v70;
                        v77 = *(_QWORD *)v103;
                        LOBYTE(v78) = 1;
                        while (2)
                        {
                          for (i = 0; i != v76; ++i)
                          {
                            if (*(_QWORD *)v103 != v77)
                              objc_enumerationMutation(v74);
                            if (!v78)
                            {

                              v82 = 0;
                              v11 = v97;
                              v53 = v98;
                              v48 = v94;
                              v51 = v95;
                              v70 = v92;
                              v52 = v93;
                              goto LABEL_31;
                            }
                            v80 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
                            v81 = objc_msgSend(v10, "minNSigmaBetweenVisits");
                            objc_msgSend(v10, "minInterVisitDistance");
                            v78 = +[TALocationLite distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:](TALocationLite, "distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:", v49, v80, v81);
                          }
                          v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
                          if (v76)
                            continue;
                          break;
                        }

                        v11 = v97;
                        v70 = v92;
                        if (!v78)
                        {
                          v82 = 0;
                          goto LABEL_34;
                        }
                      }
                      else
                      {

                      }
                      objc_msgSend(v74, "addObject:", v49);
                      v82 = 1;
LABEL_34:
                      v48 = v94;
                      v51 = v95;
                      v52 = v93;
                      v83 = v100;
                      v53 = v98;
                    }
                    else
                    {
                      v82 = 0;
                      v53 = 0;
                      v48 = v94;
                      v51 = v95;
                      v52 = v93;
LABEL_31:
                      v83 = v100;
                    }
                    v54 = v83 & v53 & v99;
                    v84 = *((_QWORD *)v11 + 2);
                    v85 = *((_QWORD *)v11 + 3);
                    if (v70)
                      ++v84;
                    *((_QWORD *)v11 + 2) = v84;
                    *((_QWORD *)v11 + 3) = v85 + v82;
                    v86 = *((_QWORD *)v11 + 5) + v54;
                    *((_QWORD *)v11 + 4) += v53 & 1;
                    *((_QWORD *)v11 + 5) = v86;

                    v101 = v49;
                  }
                  ++v55;
                }
                while (v55 != v51);
                v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
              }
              while (v51);
            }

            v9 = v88;
            v8 = v89;
            goto LABEL_41;
          }
        }
      }

    }
    v12 = 0;
  }
LABEL_44:

  return v12;
}

- (unint64_t)getMetricsCollectionType
{
  return 2;
}

- (id)descriptionDictionary
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[13];
  _QWORD v37[15];

  v37[13] = *MEMORY[0x24BDAC8D0];
  -[TAMetricsVisit visitEntryDelay](self, "visitEntryDelay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  v5 = 0.0;
  if (v3)
  {
    -[TAMetricsVisit visitEntryDelay](self, "visitEntryDelay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "duration");
    v5 = v7;

  }
  -[TAMetricsVisit visitExitDelay](self, "visitExitDelay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[TAMetricsVisit visitExitDelay](self, "visitExitDelay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duration");
    v4 = v10;

  }
  -[TAMetricsVisit distanceToPreviousSeenVisit](self, "distanceToPreviousSeenVisit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[TAMetricsVisit distanceToPreviousSeenVisit](self, "distanceToPreviousSeenVisit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

  }
  else
  {
    v14 = 0.0;
  }

  v36[0] = CFSTR("MetricsType");
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v35;
  v36[1] = CFSTR("Address");
  -[TAMetricsVisit address](self, "address");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "hexString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v33;
  v36[2] = CFSTR("TotalVisitCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAMetricsVisit totalVisitCount](self, "totalVisitCount"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v32;
  v36[3] = CFSTR("TotalDistinctVisitCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAMetricsVisit totalDistinctVisitCount](self, "totalDistinctVisitCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v31;
  v36[4] = CFSTR("ConsecutiveVisitCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAMetricsVisit consecutiveVisitCount](self, "consecutiveVisitCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v16;
  v36[5] = CFSTR("ConsecutiveAndDistinctFromPrevVisitCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAMetricsVisit consecutiveAndDistinctFromPrevVisitCount](self, "consecutiveAndDistinctFromPrevVisitCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v17;
  v36[6] = CFSTR("DurationOfVisitEntryConsideration");
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[TAMetricsVisit durationOfVisitEntryConsideration](self, "durationOfVisitEntryConsideration");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v19;
  v36[7] = CFSTR("DurationOfVisitExitConsideration");
  v20 = (void *)MEMORY[0x24BDD16E0];
  -[TAMetricsVisit durationOfVisitExitConsideration](self, "durationOfVisitExitConsideration");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v21;
  v36[8] = CFSTR("EntryDelay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v22;
  v36[9] = CFSTR("ExitDelay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v23;
  v36[10] = CFSTR("Latitude");
  v24 = (void *)MEMORY[0x24BDD16E0];
  -[TAMetricsVisit latitude](self, "latitude");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[10] = v25;
  v36[11] = CFSTR("Longitude");
  v26 = (void *)MEMORY[0x24BDD16E0];
  -[TAMetricsVisit longitude](self, "longitude");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[11] = v27;
  v36[12] = CFSTR("DistanceToPreviousSeenVisit");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[12] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[TAMetricsVisit descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAOutgoingRequests description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (NSData)address
{
  return self->_address;
}

- (unint64_t)totalVisitCount
{
  return self->_totalVisitCount;
}

- (unint64_t)totalDistinctVisitCount
{
  return self->_totalDistinctVisitCount;
}

- (unint64_t)consecutiveVisitCount
{
  return self->_consecutiveVisitCount;
}

- (unint64_t)consecutiveAndDistinctFromPrevVisitCount
{
  return self->_consecutiveAndDistinctFromPrevVisitCount;
}

- (double)durationOfVisitEntryConsideration
{
  return self->_durationOfVisitEntryConsideration;
}

- (double)durationOfVisitExitConsideration
{
  return self->_durationOfVisitExitConsideration;
}

- (NSDateInterval)visitEntryDelay
{
  return self->_visitEntryDelay;
}

- (NSDateInterval)visitExitDelay
{
  return self->_visitExitDelay;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSNumber)distanceToPreviousSeenVisit
{
  return self->_distanceToPreviousSeenVisit;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_distanceToPreviousSeenVisit, 0);
  objc_storeStrong((id *)&self->_visitExitDelay, 0);
  objc_storeStrong((id *)&self->_visitEntryDelay, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
