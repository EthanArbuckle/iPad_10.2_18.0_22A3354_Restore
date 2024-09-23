@implementation RAPWebBundleQuestion

- (RAPWebBundleQuestion)initWithReport:(id)a3 questionType:(int64_t)a4
{
  RAPWebBundleQuestion *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPWebBundleQuestion;
  result = -[RAPQuestion initWithReport:parentQuestion:](&v6, "initWithReport:parentQuestion:", a3, 0);
  if (result)
    result->_questionType = a4;
  return result;
}

- (RAPWebBundleQuestion)initWithReport:(id)a3 place:(id)a4 questionType:(int64_t)a5
{
  id v9;
  RAPWebBundleQuestion *v10;
  RAPWebBundleQuestion *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RAPWebBundleQuestion;
  v10 = -[RAPQuestion initWithReport:parentQuestion:](&v13, "initWithReport:parentQuestion:", a3, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_reportedPlace, a4);
    v11->_questionType = a5;
  }

  return v11;
}

- (RAPWebBundleQuestion)initWithReport:(id)a3 place:(id)a4 poiCorrectionType:(int)a5 questionType:(int64_t)a6
{
  RAPWebBundleQuestion *result;

  result = -[RAPWebBundleQuestion initWithReport:place:questionType:](self, "initWithReport:place:questionType:", a3, a4, a6);
  if (result)
    result->_poiCorrectionType = a5;
  return result;
}

- (RAPWebBundleQuestion)initWithReport:(id)a3 directionsRecording:(id)a4
{
  id v7;
  RAPWebBundleQuestion *v8;
  RAPWebBundleQuestion *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RAPWebBundleQuestion;
  v8 = -[RAPQuestion initWithReport:parentQuestion:](&v11, "initWithReport:parentQuestion:", a3, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_directionsRecording, a4);
    v9->_questionType = 23;
  }

  return v9;
}

- (void)setReportedUserPath:(id)a3
{
  RAPUserPathEntry **p_reportedUserPath;
  id v5;

  p_reportedUserPath = &self->_reportedUserPath;
  v5 = a3;
  if (!-[RAPUserPathEntry isEqual:](*p_reportedUserPath, "isEqual:"))
    objc_storeStrong((id *)p_reportedUserPath, a3);

}

- (void)setDirectionsRecording:(id)a3
{
  RAPDirectionsRecording **p_directionsRecording;
  id v5;

  p_directionsRecording = &self->_directionsRecording;
  v5 = a3;
  if (!-[RAPDirectionsRecording isEqual:](*p_directionsRecording, "isEqual:"))
    objc_storeStrong((id *)p_directionsRecording, a3);

}

- (BOOL)isAnonymous
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPWebBundleQuestion;
  v3 = -[RAPQuestion isAnonymous](&v5, "isAnonymous");
  if (v3)
    LOBYTE(v3) = self->_questionType != 10;
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
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
  unsigned int v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  RAPDirectionsRecording *v50;
  id v51;
  RAPUserPathEntry *reportedUserPath;
  unsigned int v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  NSObject *v60;
  RAPUserPathEntry *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  RAPUserPathEntry *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  unsigned int v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  unsigned __int8 v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  RAPUserPathEntry *v100;
  unsigned int v101;
  void *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  NSObject *v115;
  RAPUserPathEntry *v116;
  void *v117;
  unsigned int v118;
  void *v119;
  unint64_t v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  id v128;
  char *v129;
  uint64_t v130;
  char *v131;
  id v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  uint8_t v150[128];
  uint8_t buf[4];
  RAPUserPathEntry *v152;
  __int16 v153;
  id v154;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));

  if (!v5)
  {
    v6 = (void *)objc_opt_new(GEORPFeedbackDetails);
    objc_msgSend(v4, "setDetails:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion dynamicForm](self, "dynamicForm"));
  objc_msgSend(v4, "setDynamicForm:", v7);

  switch(self->_questionType)
  {
    case 1:
    case 0xALL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "addressPointFeedback"));

      if (!v9)
      {
        v9 = objc_alloc_init((Class)GEORPAddressFeedback);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
        objc_msgSend(v17, "setAddressPointFeedback:", v9);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "place"));

      if (!v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlace mapItem](self->_reportedPlace, "mapItem"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_geoMapItem"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_placeData"));
        objc_msgSend(v9, "setPlace:", v21);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlace placeInfo](self->_reportedPlace, "placeInfo"));

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlace placeInfo](self->_reportedPlace, "placeInfo"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "placeRequest"));
        objc_msgSend(v9, "setPlaceRequest:", v24);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlace mapItem](self->_reportedPlace, "mapItem"));
      v26 = objc_msgSend(v25, "_maps_isHomeWorkOrSchool");

      if (!v26)
        goto LABEL_80;
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personalizedMaps"));
      if (!v12)
      {
        v12 = objc_alloc_init((Class)GEORPPersonalizedMapsContext);
        objc_msgSend(v9, "setPersonalizedMaps:", v12);
      }
      objc_msgSend(v12, "setAddressType:", 9);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlace mapItem](self->_reportedPlace, "mapItem"));
      v28 = objc_msgSend(v27, "_maps_isHome");

      if ((v28 & 1) != 0)
      {
        v29 = 1;
      }
      else
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlace mapItem](self->_reportedPlace, "mapItem"));
        v92 = objc_msgSend(v91, "_maps_isWork");

        if ((v92 & 1) != 0)
        {
          v29 = 2;
        }
        else
        {
          v117 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlace mapItem](self->_reportedPlace, "mapItem"));
          v118 = objc_msgSend(v117, "_maps_isSchool");

          if (v118)
            v29 = 3;
          else
            v29 = 0;
        }
      }
      objc_msgSend(v12, "setPlaceType:", v29);
      goto LABEL_79;
    case 2:
    case 9:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x18:
    case 0x19:
    case 0x1DLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "poiFeedback"));

      if (!v9)
      {
        v9 = objc_alloc_init((Class)GEORPPoiFeedback);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
        objc_msgSend(v10, "setPoiFeedback:", v9);

      }
      objc_msgSend(v9, "setCorrectionType:", self->_poiCorrectionType);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "place"));

      if (v11)
        goto LABEL_80;
      v12 = (id)objc_claimAutoreleasedReturnValue(-[RAPPlace mapItem](self->_reportedPlace, "mapItem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_geoMapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_placeData"));
      objc_msgSend(v9, "setPlace:", v14);
      goto LABEL_8;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 0x1CLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addMapFeedback"));

      if (v9)
        goto LABEL_80;
      v9 = objc_alloc_init((Class)GEORPAddToMapFeedback);
      objc_msgSend(v9, "setIsEntrypointReportSomethingMissing:", GEOConfigGetBOOL(MapKitConfig_RAPFlowReportSomethingMissing[0], MapKitConfig_RAPFlowReportSomethingMissing[1]));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      objc_msgSend(v12, "setAddMapFeedback:", v9);
      goto LABEL_79;
    case 0xBLL:
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localityFeedback"));

      if (!v9)
      {
        v9 = objc_alloc_init((Class)GEORPLocalityFeedback);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
        objc_msgSend(v40, "setLocalityFeedback:", v9);

      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "place"));

      if (!v41)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mapItem"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "_geoMapItem"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "_placeData"));
        objc_msgSend(v9, "setPlace:", v45);

      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlace placeInfo](self->_reportedPlace, "placeInfo"));

      if (!v46)
        goto LABEL_80;
      v12 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "placeRequest"));
      objc_msgSend(v9, "setPlaceRequest:", v14);
      goto LABEL_8;
    case 0x15:
    case 0x16:
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "streetFeedback"));

      if (v9)
        goto LABEL_80;
      v9 = objc_alloc_init((Class)GEORPStreetFeedback);
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      objc_msgSend(v12, "setStreetFeedback:", v9);
      goto LABEL_79;
    case 0x17:
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v48 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "directionsFeedback"));

      if (!v48)
      {
        v48 = objc_alloc_init((Class)GEORPDirectionsFeedback);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
        objc_msgSend(v49, "setDirectionsFeedback:", v48);

      }
      v50 = self->_directionsRecording;
      v51 = objc_alloc_init((Class)GEORPDirectionsFeedbackContext);
      reportedUserPath = self->_reportedUserPath;
      if (reportedUserPath
        && (v53 = -[RAPUserPathEntry routeIndex](reportedUserPath, "routeIndex"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording routes](v50, "routes")),
            v55 = objc_msgSend(v54, "count"),
            v54,
            (unint64_t)v55 > v53))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording routes](v50, "routes"));
        v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", -[RAPUserPathEntry routeIndex](self->_reportedUserPath, "routeIndex")));

        v58 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v57, 0);
        objc_msgSend(v51, "setRoutes:", v58);

        v59 = sub_100431F8C();
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          v61 = self->_reportedUserPath;
          *(_DWORD *)buf = 138412546;
          v152 = v61;
          v153 = 2112;
          v154 = (id)v57;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "updating RAPWebBundleQuestion with reportedUserPath: %@ and singleRoute: %@", buf, 0x16u);
        }
      }
      else
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording routes](v50, "routes"));
        v63 = objc_msgSend(v62, "mutableCopy");
        objc_msgSend(v51, "setRoutes:", v63);

        v64 = sub_100431F8C();
        v60 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          v65 = v51;
          v66 = self->_reportedUserPath;
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording routes](v50, "routes"));
          *(_DWORD *)buf = 138412546;
          v152 = v66;
          v51 = v65;
          v153 = 2048;
          v154 = objc_msgSend(v67, "count");
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "updating RAPWebBundleQuestion with reportedUserPath: %@ and multiple routes (count: %ld)", buf, 0x16u);

        }
        v57 = 0;
      }
      v139 = (void *)v57;
      v140 = v48;

      v68 = objc_claimAutoreleasedReturnValue(-[RAPUserPathEntry rerouteLocation](self->_reportedUserPath, "rerouteLocation"));
      if (v68)
      {
        v69 = (void *)v68;
        v70 = -[RAPUserPathEntry traversal](self->_reportedUserPath, "traversal");

        if (v70 == 2)
        {
          v71 = objc_alloc((Class)NSMutableArray);
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserPathEntry rerouteLocation](self->_reportedUserPath, "rerouteLocation"));
          v73 = objc_msgSend(v71, "initWithObjects:", v72, 0);
          objc_msgSend(v51, "setRerouteLocations:", v73);

        }
      }
      v74 = objc_alloc((Class)GEORPPlaceInfo);
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording startWaypointCorrectedSearchTemplate](v50, "startWaypointCorrectedSearchTemplate"));
      v76 = objc_msgSend(v74, "initWithCorrectedSearch:", v75);

      objc_msgSend(v76, "clearSessionId");
      v77 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "placeRequest"));
      objc_msgSend(v77, "setPlaceRequest:", v78);

      v138 = v76;
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "placeResponse"));
      objc_msgSend(v77, "setPlaceResponse:", v79);

      v80 = objc_alloc((Class)GEORPPlaceInfo);
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording endWaypointCorrectedSearchTemplate](v50, "endWaypointCorrectedSearchTemplate"));
      v82 = objc_msgSend(v80, "initWithCorrectedSearch:", v81);

      objc_msgSend(v82, "clearSessionId");
      v83 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "placeRequest"));
      objc_msgSend(v83, "setPlaceRequest:", v84);

      v137 = v82;
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "placeResponse"));
      objc_msgSend(v83, "setPlaceResponse:", v85);

      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v77, v83, 0));
      objc_msgSend(v51, "setDirectionsWaypointPlaceInfos:", v86);

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording startWaypoint](v50, "startWaypoint"));
      if (v87)
      {
        v88 = objc_alloc((Class)GEORPUserSearchInput);
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording startWaypoint](v50, "startWaypoint"));
        v90 = objc_msgSend(v88, "initWithRAPUserSearchInput:", v89);
        objc_msgSend(v51, "setStartWaypoint:", v90);

      }
      else
      {
        objc_msgSend(v51, "setStartWaypoint:", 0);
      }

      v93 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording endWaypoint](v50, "endWaypoint"));
      if (v93)
      {
        v94 = objc_alloc((Class)GEORPUserSearchInput);
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording endWaypoint](v50, "endWaypoint"));
        v96 = objc_msgSend(v94, "initWithRAPUserSearchInput:", v95);
        objc_msgSend(v51, "setEndWaypoint:", v96);

      }
      else
      {
        objc_msgSend(v51, "setEndWaypoint:", 0);
      }
      v97 = v139;

      v98 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording endWaypoint](v50, "endWaypoint"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "findMyHandleID"));

      if (v99)
        objc_msgSend(v51, "setIsRouteToPerson:", 1);
      if (!v139)
        goto LABEL_88;
      v100 = self->_reportedUserPath;
      if (!v100)
        goto LABEL_88;
      v101 = -[RAPUserPathEntry stepIndex](v100, "stepIndex");
      v145 = 0u;
      v146 = 0u;
      v147 = 0u;
      v148 = 0u;
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "routeLegs"));
      v103 = (char *)objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v145, v150, 16);
      if (!v103)
        goto LABEL_73;
      v104 = 0;
      v135 = v101;
      v136 = 0;
      v105 = *(_QWORD *)v146;
      v132 = v77;
      v133 = v51;
      v134 = v102;
      v130 = *(_QWORD *)v146;
      break;
    case 0x1ALL:
    case 0x1BLL:
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "transitPoiFeedback"));

      if (!v9)
      {
        v9 = objc_alloc_init((Class)GEORPTransitPoiFeedback);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
        objc_msgSend(v32, "setTransitPoiFeedback:", v9);

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "transitPoiFeedback"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "place"));

      if (v35)
        goto LABEL_80;
      v12 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geoMapItem"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_placeData"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "transitPoiFeedback"));
      objc_msgSend(v38, "setPlace:", v36);

LABEL_8:
LABEL_79:

LABEL_80:
      goto LABEL_81;
    default:
      goto LABEL_81;
  }
  do
  {
    v106 = 0;
    v107 = v104;
    v129 = &v104[(_QWORD)v103];
    v131 = v103;
    do
    {
      if (*(_QWORD *)v146 != v105)
        objc_enumerationMutation(v102);
      v108 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)v106);
      v141 = 0u;
      v142 = 0u;
      v143 = 0u;
      v144 = 0u;
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "steps"));
      v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
      if (v110)
      {
        v111 = v110;
        v112 = *(_QWORD *)v142;
        while (2)
        {
          v113 = v135 - v136;
          v136 += (uint64_t)v111;
          do
          {
            if (*(_QWORD *)v142 != v112)
              objc_enumerationMutation(v109);
            if (!v113)
            {

              v120 = (unint64_t)(v107 + 1);
              v121 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording waypoints](v50, "waypoints"));
              v122 = objc_msgSend(v121, "count");

              if (v120 >= (unint64_t)v122)
              {
                v126 = sub_100431F8C();
                v115 = objc_claimAutoreleasedReturnValue(v126);
                v48 = v140;
                v77 = v132;
                v51 = v133;
                if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                {
                  v127 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording waypoints](v50, "waypoints"));
                  v128 = objc_msgSend(v127, "count");
                  *(_DWORD *)buf = 134218240;
                  v152 = (RAPUserPathEntry *)v120;
                  v153 = 2048;
                  v154 = v128;
                  _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "found waypointIndex: %lu but recorded waypoints did not match: %lu", buf, 0x16u);

                }
                v97 = v139;
              }
              else
              {
                v123 = objc_alloc((Class)GEORPUserSearchInput);
                v115 = objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording waypoints](v50, "waypoints"));
                v124 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v115, "objectAtIndexedSubscript:", v120));
                v125 = objc_msgSend(v123, "initWithRAPUserSearchInput:", v124);
                v51 = v133;
                objc_msgSend(v133, "setEndWaypoint:", v125);

                v97 = v139;
                v48 = v140;
                v77 = v132;
              }
              goto LABEL_87;
            }
            --v113;
            v111 = (char *)v111 - 1;
          }
          while (v111);
          v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
          if (v111)
            continue;
          break;
        }
      }

      ++v107;
      ++v106;
      v105 = v130;
      v48 = v140;
      v51 = v133;
      v102 = v134;
    }
    while (v106 != v131);
    v103 = (char *)objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v145, v150, 16);
    v97 = v139;
    v77 = v132;
    v104 = v129;
  }
  while (v103);
LABEL_73:

  v114 = sub_100431F8C();
  v115 = objc_claimAutoreleasedReturnValue(v114);
  if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
  {
    v116 = self->_reportedUserPath;
    *(_DWORD *)buf = 138412546;
    v152 = v116;
    v153 = 2112;
    v154 = v97;
    _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "Did not find waypointIndex for path: %@ in route: %@", buf, 0x16u);
  }
LABEL_87:

LABEL_88:
  objc_msgSend(v48, "setDirectionsContext:", v51);

LABEL_81:
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion geotaggedPhotoCommentQuestion](self, "geotaggedPhotoCommentQuestion"));
  objc_msgSend(v119, "_fillSubmissionParameters:", v4);

}

- (BOOL)isComplete
{
  return 1;
}

- (id)questionTypeAsString
{
  unint64_t v2;

  v2 = -[RAPWebBundleQuestion questionType](self, "questionType");
  if (v2 > 0x1D)
    return CFSTR("poi");
  else
    return off_1011BA000[v2];
}

- (RAPCommentQuestion)geotaggedPhotoCommentQuestion
{
  RAPCommentQuestion *geotaggedPhotoCommentQuestion;
  RAPCommentQuestion *v4;
  void *v5;
  void *v6;
  void *v7;
  RAPCommentQuestion *v8;
  RAPCommentQuestion *v9;

  geotaggedPhotoCommentQuestion = self->_geotaggedPhotoCommentQuestion;
  if (!geotaggedPhotoCommentQuestion)
  {
    v4 = [RAPCommentQuestion alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Details [Report a Problem photos]"), CFSTR("localized string not found"), 0));
    v8 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](v4, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v5, self, v7, 0, 4);
    v9 = self->_geotaggedPhotoCommentQuestion;
    self->_geotaggedPhotoCommentQuestion = v8;

    geotaggedPhotoCommentQuestion = self->_geotaggedPhotoCommentQuestion;
  }
  return geotaggedPhotoCommentQuestion;
}

- (void)retrieveContextwithLocales:(id)a3 contextCompletion:(id)a4
{
  RAPWebBundlePOIContext *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t i;
  void *v19;
  _QWORD *v20;
  unint64_t j;
  id v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  RAPPlaceCorrectableAddress *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  RAPWebBundlePOIContext *v39;
  NSObject *v40;
  RAPWebBundlePOIContext *v41;
  void *v42;
  RAPWebBundlePOIContext *v43;
  NSObject *v44;
  RAPWebBundleAddToMapContext *v45;
  void *v46;
  RAPWebBundleAddToMapContext *v47;
  RAPPlaceCorrectableAddress *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  RAPWebBundleBaseContext *v55;
  void *v56;
  RAPWebBundleBaseContext *v57;
  id v58;
  RAPWebBundlePOIContext *v59;
  void *v60;
  RAPWebBundlePOIContext *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  RAPWebBundleAddToMapContext *v66;
  void *v67;
  RAPWebBundleAddToMapContext *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  RAPWebBundleQuestion *v75;
  NSObject *group;
  NSObject *v77;
  RAPWebBundlePOIContext *v78;
  id obj;
  _QWORD block[4];
  id v81;
  uint64_t *v82;
  _QWORD *v83;
  _QWORD v84[4];
  RAPWebBundlePOIContext *v85;
  NSObject *v86;
  _QWORD *v87;
  uint64_t *v88;
  _QWORD v89[4];
  RAPWebBundlePOIContext *v90;
  NSObject *v91;
  _QWORD *v92;
  uint64_t *v93;
  _QWORD v94[5];
  RAPWebBundlePOIContext *v95;
  NSObject *v96;
  _QWORD *v97;
  uint64_t *v98;
  _QWORD v99[4];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  id v106;
  NSObject *v107;
  _QWORD *v108;
  uint64_t *v109;
  uint8_t buf[8];
  _QWORD v111[5];
  id v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  _BYTE v119[128];

  v74 = a3;
  v73 = a4;
  group = dispatch_group_create();
  v113 = 0;
  v114 = &v113;
  v115 = 0x3032000000;
  v116 = sub_100516D78;
  v117 = sub_100516D88;
  v118 = 0;
  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x3032000000;
  v111[3] = sub_100516D78;
  v111[4] = sub_100516D88;
  v112 = objc_alloc_init((Class)NSMutableArray);
  switch(-[RAPWebBundleQuestion questionType](self, "questionType"))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 0xALL:
      v45 = [RAPWebBundleAddToMapContext alloc];
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion questionTypeAsString](self, "questionTypeAsString"));
      v47 = -[RAPWebBundleBaseContext initWithType:locales:](v45, "initWithType:locales:", v46, v74);

      v48 = [RAPPlaceCorrectableAddress alloc];
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "mapItem"));
      v44 = -[RAPPlaceCorrectableAddress _initWithMapItem:](v48, "_initWithMapItem:", v50);

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject freeformAddress](v44, "freeformAddress"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "value"));
      -[RAPWebBundleAddToMapContext setAddress:](v47, "setAddress:", v52);

      v53 = (void *)v114[5];
      v114[5] = (uint64_t)v47;

      goto LABEL_21;
    case 9:
    case 0xBLL:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x18:
    case 0x19:
    case 0x1ALL:
    case 0x1DLL:
      v75 = self;
      v6 = [RAPWebBundlePOIContext alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion questionTypeAsString](self, "questionTypeAsString"));
      v78 = -[RAPWebBundleBaseContext initWithType:locales:](v6, "initWithType:locales:", v7, v74);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
      v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));

      v71 = objc_msgSend(objc_alloc((Class)_MKLocalizedHoursBuilder), "initWithMapItem:localizedHoursStringOptions:", v77, 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "operatingHours"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "pdHours"));
      v10 = sub_100A4C65C(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);

      v12 = objc_alloc_init((Class)NSMutableArray);
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      obj = (id)v11;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v102;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v102 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)v15);
            v17 = objc_alloc_init((Class)NSMutableArray);
            for (i = 0; i < (unint64_t)objc_msgSend(v16, "daysCount"); ++i)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "daysAsString:", objc_msgSend(v16, "dayAtIndex:", i)));
              objc_msgSend(v17, "addObject:", v19);

            }
            if (objc_msgSend(v17, "count"))
            {
              v99[0] = _NSConcreteStackBlock;
              v99[1] = 3221225472;
              v99[2] = sub_100516EB0;
              v99[3] = &unk_1011B9F40;
              v100 = v17;
              v20 = objc_retainBlock(v99);
              for (j = 0; j < (unint64_t)objc_msgSend(v16, "timeRangesCount"); ++j)
              {
                v22 = objc_msgSend(v16, "timeRangeAtIndex:", j);
                v11 = v11 & 0xFFFFFFFF00000000 | v23;
                v24 = ((uint64_t (*)(_QWORD *, id, unint64_t))v20[2])(v20, v22, v11);
                v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                objc_msgSend(v12, "addObject:", v25);

              }
            }

            v15 = (char *)v15 + 1;
          }
          while (v15 != v13);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
        }
        while (v13);
      }

      v26 = [RAPPlaceCorrectableAddress alloc];
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](v75, "reportedPlace"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
      v29 = -[RAPPlaceCorrectableAddress _initWithMapItem:](v26, "_initWithMapItem:", v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "freeformAddress"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "value"));
      -[RAPWebBundleAddToMapContext setAddress:](v78, "setAddress:", v31);

      -[RAPWebBundlePOIContext setBusinessHours:](v78, "setBusinessHours:", v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject name](v77, "name"));
      -[RAPWebBundlePOIContext setName:](v78, "setName:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject phoneNumber](v77, "phoneNumber"));
      -[RAPWebBundlePOIContext setPhoneNumber:](v78, "setPhoneNumber:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject url](v77, "url"));
      v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "absoluteString"));
      -[RAPWebBundlePOIContext setUrl:](v78, "setUrl:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _localizedCategoryNamesForType:](v77, "_localizedCategoryNamesForType:", 0));
      -[RAPWebBundlePOIContext setCategories:](v78, "setCategories:", v36);

      -[RAPWebBundlePOIContext setPermanentClosed:](v78, "setPermanentClosed:", objc_msgSend(v72, "hoursType") == (id)4);
      -[RAPWebBundlePOIContext setTemporaryClosed:](v78, "setTemporaryClosed:", objc_msgSend(v72, "hoursType") == (id)3);
      -[RAPWebBundlePOIContext setAcceptsApplePay:](v78, "setAcceptsApplePay:", -[NSObject _acceptsApplePay](v77, "_acceptsApplePay"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _transitInfo](v77, "_transitInfo"));
      LOBYTE(v35) = objc_msgSend(v37, "linesCount") == 0;

      if ((v35 & 1) == 0)
      {
        dispatch_group_enter(group);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](v75, "reportedPlace"));
        v94[0] = _NSConcreteStackBlock;
        v94[1] = 3221225472;
        v94[2] = sub_100516F4C;
        v94[3] = &unk_1011B9F68;
        v94[4] = v75;
        v97 = v111;
        v95 = v78;
        v98 = &v113;
        v96 = group;
        -[RAPWebBundleQuestion _fetchTransitInfoFromStation:withCompletion:](v75, "_fetchTransitInfoFromStation:withCompletion:", v38, v94);

      }
      dispatch_group_enter(group);
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_10051709C;
      v89[3] = &unk_1011B9F90;
      v39 = v78;
      v90 = v39;
      v92 = v111;
      v93 = &v113;
      v40 = group;
      v91 = v40;
      -[RAPWebBundleQuestion _fetchChildContainmentWithCompletion:](v75, "_fetchChildContainmentWithCompletion:", v89);
      dispatch_group_enter(v40);
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_100517124;
      v84[3] = &unk_1011B9F90;
      v41 = v39;
      v85 = v41;
      v87 = v111;
      v88 = &v113;
      v86 = v40;
      -[RAPWebBundleQuestion _fetchParentContainmentWithCompletion:](v75, "_fetchParentContainmentWithCompletion:", v84);
      v42 = (void *)v114[5];
      v114[5] = (uint64_t)v41;
      v43 = v41;

      v44 = v77;
      goto LABEL_21;
    case 0x15:
    case 0x16:
      v55 = [RAPWebBundleBaseContext alloc];
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion questionTypeAsString](self, "questionTypeAsString"));
      v57 = -[RAPWebBundleBaseContext initWithType:locales:](v55, "initWithType:locales:", v56, v74);

      v44 = v114[5];
      v114[5] = (uint64_t)v57;
      goto LABEL_21;
    case 0x17:
      v58 = sub_100431F8C();
      v44 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, ".context called on RAPWebBundleQuestion.directions. This is not supported.", buf, 2u);
      }
      goto LABEL_21;
    case 0x1BLL:
      v59 = [RAPWebBundlePOIContext alloc];
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion questionTypeAsString](self, "questionTypeAsString"));
      v61 = -[RAPWebBundleBaseContext initWithType:locales:](v59, "initWithType:locales:", v60, v74);

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "_context"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "reportedLine"));

      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_100516D90;
      v105[3] = &unk_1011B9F90;
      v65 = v64;
      v106 = v65;
      v108 = v111;
      v44 = v61;
      v107 = v44;
      v109 = &v113;
      -[RAPWebBundleQuestion _fetchTransitInfoFromReportedLine:withCompletion:](self, "_fetchTransitInfoFromReportedLine:withCompletion:", v65, v105);

      goto LABEL_21;
    case 0x1CLL:
      v66 = [RAPWebBundleAddToMapContext alloc];
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion questionTypeAsString](self, "questionTypeAsString"));
      v68 = -[RAPWebBundleBaseContext initWithType:locales:](v66, "initWithType:locales:", v67, v74);

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "userVisibleTitle"));
      -[RAPWebBundleAddToMapContext setEntityName:](v68, "setEntityName:", v70);

      v44 = v114[5];
      v114[5] = (uint64_t)v68;
LABEL_21:

      break;
    default:
      break;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005171AC;
  block[3] = &unk_1011B0B38;
  v81 = v73;
  v82 = &v113;
  v83 = v111;
  v54 = v73;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v111, 8);
  _Block_object_dispose(&v113, 8);

}

- (void)_fetchTransitInfoFromStation:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_transitInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lines"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = MKMapItemIdentifierFromGEOTransitLine(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        objc_msgSend(v9, "addObject:", v18);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mapsDefaultTraits"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ticketForTransitLines:traits:", v20, v22));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100517490;
  v27[3] = &unk_1011B7580;
  v28 = v8;
  v29 = v7;
  v30 = v6;
  v24 = v6;
  v25 = v7;
  v26 = v8;
  objc_msgSend(v23, "submitWithHandler:networkActivity:", v27, 0);

}

- (void)_fetchTransitInfoFromReportedLine:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *, void *);
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  UIImage *v11;
  void *v12;
  RAPWebBundleImageContext *v13;
  NSData *v14;
  void *v15;
  RAPWebBundleTransitLineContext *v16;
  void *v17;
  void *v18;
  void *v19;
  RAPWebBundleImageContext *v20;
  RAPWebBundleTransitLineContext *v21;

  v5 = (void (**)(id, void *, void *))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artwork"));
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v10, 6, v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v6, "lineFeatureID")));
  v13 = objc_alloc_init(RAPWebBundleImageContext);
  v14 = UIImagePNGRepresentation(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[RAPWebBundleImageContext setImage:](v13, "setImage:", v15);

  -[RAPWebBundleImageContext setIdentifier:](v13, "setIdentifier:", v12);
  v16 = objc_alloc_init(RAPWebBundleTransitLineContext);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));

  -[RAPWebBundleTransitLineContext setName:](v16, "setName:", v17);
  -[RAPWebBundleTransitLineContext setIdentifier:](v16, "setIdentifier:", v12);
  -[RAPWebBundleTransitLineContext setImageContext:](v16, "setImageContext:", v13);
  if (v5)
  {
    v21 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v20 = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v5[2](v5, v18, v19);

  }
}

- (void)_fetchChildContainmentWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_firstRelatedPlaceListForType:", 3));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapIdentifiers", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), "muid")));
        objc_msgSend(v5, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[RAPWebBundleQuestion _fetchContainmentItems:withCompletion:](self, "_fetchContainmentItems:withCompletion:", v5, v4);
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)_fetchParentContainmentWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_containedPlace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parent"));

  v9 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v8, "_hasMUID"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "_muid")));
    objc_msgSend(v9, "addObject:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleQuestion reportedPlace](self, "reportedPlace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_geoMapItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_venueInfo"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parent"));
  if (objc_msgSend(v15, "businessID"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parent"));
    v17 = objc_msgSend(v16, "businessID");
    v18 = objc_msgSend(v8, "_muid");

    if (v17 == v18)
      goto LABEL_7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parent"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "businessID")));
    objc_msgSend(v9, "addObject:", v19);

  }
LABEL_7:
  if (objc_msgSend(v9, "count"))
  {
    -[RAPWebBundleQuestion _fetchContainmentItems:withCompletion:](self, "_fetchContainmentItems:withCompletion:", v9, v20);
  }
  else if (v20)
  {
    (*((void (**)(id, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
  }

}

- (void)_fetchContainmentItems:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "defaultTraits"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForMUIDs:traits:", v6, v12));

  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100517E38;
  v18[3] = &unk_1011B9FE0;
  objc_copyWeak(&v22, &location);
  v14 = v7;
  v21 = v14;
  v15 = v9;
  v19 = v15;
  v16 = v8;
  v20 = v16;
  v17 = &_dispatch_main_q;
  objc_msgSend(v13, "submitWithHandler:networkActivity:queue:", v18, 0, &_dispatch_main_q);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (id)_alternateDirectionsRecording
{
  return self->_directionsRecording;
}

- (RAPPlace)reportedPlace
{
  return self->_reportedPlace;
}

- (GEORPFeedbackDynamicForm)dynamicForm
{
  return self->_dynamicForm;
}

- (void)setDynamicForm:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicForm, a3);
}

- (int64_t)questionType
{
  return self->_questionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicForm, 0);
  objc_storeStrong((id *)&self->_reportedPlace, 0);
  objc_storeStrong((id *)&self->_geotaggedPhotoCommentQuestion, 0);
  objc_storeStrong((id *)&self->_reportedUserPath, 0);
  objc_storeStrong((id *)&self->_directionsRecording, 0);
}

@end
