@implementation GRPSchemaSiriEventTypeUnion

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  void *v121;
  int v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  void *v142;
  int v143;
  id v144;
  objc_super v146;

  v4 = a3;
  v146.receiver = self;
  v146.super_class = (Class)GRPSchemaSiriEventTypeUnion;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v146, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GRPSchemaSiriEventTypeUnion ueiClientEvent](self, "ueiClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[GRPSchemaSiriEventTypeUnion deleteUeiClientEvent](self, "deleteUeiClientEvent");
  -[GRPSchemaSiriEventTypeUnion petUploadEvent](self, "petUploadEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[GRPSchemaSiriEventTypeUnion deletePetUploadEvent](self, "deletePetUploadEvent");
  -[GRPSchemaSiriEventTypeUnion provisionalEvent](self, "provisionalEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[GRPSchemaSiriEventTypeUnion deleteProvisionalEvent](self, "deleteProvisionalEvent");
  -[GRPSchemaSiriEventTypeUnion testExecutionEvent](self, "testExecutionEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[GRPSchemaSiriEventTypeUnion deleteTestExecutionEvent](self, "deleteTestExecutionEvent");
  -[GRPSchemaSiriEventTypeUnion requestLinkEvent](self, "requestLinkEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[GRPSchemaSiriEventTypeUnion deleteRequestLinkEvent](self, "deleteRequestLinkEvent");
  -[GRPSchemaSiriEventTypeUnion flowClientEvent](self, "flowClientEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[GRPSchemaSiriEventTypeUnion deleteFlowClientEvent](self, "deleteFlowClientEvent");
  -[GRPSchemaSiriEventTypeUnion camClientEvent](self, "camClientEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[GRPSchemaSiriEventTypeUnion deleteCamClientEvent](self, "deleteCamClientEvent");
  -[GRPSchemaSiriEventTypeUnion uspClientEvent](self, "uspClientEvent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[GRPSchemaSiriEventTypeUnion deleteUspClientEvent](self, "deleteUspClientEvent");
  -[GRPSchemaSiriEventTypeUnion dimClientEvent](self, "dimClientEvent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[GRPSchemaSiriEventTypeUnion deleteDimClientEvent](self, "deleteDimClientEvent");
  -[GRPSchemaSiriEventTypeUnion nlxClientEvent](self, "nlxClientEvent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[GRPSchemaSiriEventTypeUnion deleteNlxClientEvent](self, "deleteNlxClientEvent");
  -[GRPSchemaSiriEventTypeUnion orchClientEvent](self, "orchClientEvent");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[GRPSchemaSiriEventTypeUnion deleteOrchClientEvent](self, "deleteOrchClientEvent");
  -[GRPSchemaSiriEventTypeUnion asrClientEvent](self, "asrClientEvent");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[GRPSchemaSiriEventTypeUnion deleteAsrClientEvent](self, "deleteAsrClientEvent");
  -[GRPSchemaSiriEventTypeUnion ihClientEvent](self, "ihClientEvent");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[GRPSchemaSiriEventTypeUnion deleteIhClientEvent](self, "deleteIhClientEvent");
  -[GRPSchemaSiriEventTypeUnion mhClientEvent](self, "mhClientEvent");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[GRPSchemaSiriEventTypeUnion deleteMhClientEvent](self, "deleteMhClientEvent");
  -[GRPSchemaSiriEventTypeUnion ttsClientEvent](self, "ttsClientEvent");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[GRPSchemaSiriEventTypeUnion deleteTtsClientEvent](self, "deleteTtsClientEvent");
  -[GRPSchemaSiriEventTypeUnion clpClientEvent](self, "clpClientEvent");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[GRPSchemaSiriEventTypeUnion deleteClpClientEvent](self, "deleteClpClientEvent");
  -[GRPSchemaSiriEventTypeUnion rrClientEvent](self, "rrClientEvent");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[GRPSchemaSiriEventTypeUnion deleteRrClientEvent](self, "deleteRrClientEvent");
  -[GRPSchemaSiriEventTypeUnion cnvClientEvent](self, "cnvClientEvent");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[GRPSchemaSiriEventTypeUnion deleteCnvClientEvent](self, "deleteCnvClientEvent");
  -[GRPSchemaSiriEventTypeUnion ancClientEvent](self, "ancClientEvent");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[GRPSchemaSiriEventTypeUnion deleteAncClientEvent](self, "deleteAncClientEvent");
  -[GRPSchemaSiriEventTypeUnion halClientEvent](self, "halClientEvent");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "applySensitiveConditionsPolicy:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "suppressMessage");

  if (v65)
    -[GRPSchemaSiriEventTypeUnion deleteHalClientEvent](self, "deleteHalClientEvent");
  -[GRPSchemaSiriEventTypeUnion netClientEvent](self, "netClientEvent");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "applySensitiveConditionsPolicy:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "suppressMessage");

  if (v68)
    -[GRPSchemaSiriEventTypeUnion deleteNetClientEvent](self, "deleteNetClientEvent");
  -[GRPSchemaSiriEventTypeUnion sadClientEvent](self, "sadClientEvent");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "applySensitiveConditionsPolicy:", v4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "suppressMessage");

  if (v71)
    -[GRPSchemaSiriEventTypeUnion deleteSadClientEvent](self, "deleteSadClientEvent");
  -[GRPSchemaSiriEventTypeUnion dodmlClientEvent](self, "dodmlClientEvent");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "applySensitiveConditionsPolicy:", v4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "suppressMessage");

  if (v74)
    -[GRPSchemaSiriEventTypeUnion deleteDodmlClientEvent](self, "deleteDodmlClientEvent");
  -[GRPSchemaSiriEventTypeUnion plusClientEvent](self, "plusClientEvent");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "applySensitiveConditionsPolicy:", v4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "suppressMessage");

  if (v77)
    -[GRPSchemaSiriEventTypeUnion deletePlusClientEvent](self, "deletePlusClientEvent");
  -[GRPSchemaSiriEventTypeUnion expSearchClientEvent](self, "expSearchClientEvent");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "applySensitiveConditionsPolicy:", v4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "suppressMessage");

  if (v80)
    -[GRPSchemaSiriEventTypeUnion deleteExpSearchClientEvent](self, "deleteExpSearchClientEvent");
  -[GRPSchemaSiriEventTypeUnion expSiriClientEvent](self, "expSiriClientEvent");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "applySensitiveConditionsPolicy:", v4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "suppressMessage");

  if (v83)
    -[GRPSchemaSiriEventTypeUnion deleteExpSiriClientEvent](self, "deleteExpSiriClientEvent");
  -[GRPSchemaSiriEventTypeUnion srstClientEvent](self, "srstClientEvent");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "applySensitiveConditionsPolicy:", v4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "suppressMessage");

  if (v86)
    -[GRPSchemaSiriEventTypeUnion deleteSrstClientEvent](self, "deleteSrstClientEvent");
  -[GRPSchemaSiriEventTypeUnion pommmesClientEvent](self, "pommmesClientEvent");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "applySensitiveConditionsPolicy:", v4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "suppressMessage");

  if (v89)
    -[GRPSchemaSiriEventTypeUnion deletePommmesClientEvent](self, "deletePommmesClientEvent");
  -[GRPSchemaSiriEventTypeUnion cdaClientEvent](self, "cdaClientEvent");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "applySensitiveConditionsPolicy:", v4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "suppressMessage");

  if (v92)
    -[GRPSchemaSiriEventTypeUnion deleteCdaClientEvent](self, "deleteCdaClientEvent");
  -[GRPSchemaSiriEventTypeUnion mwtClientEvent](self, "mwtClientEvent");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "applySensitiveConditionsPolicy:", v4);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "suppressMessage");

  if (v95)
    -[GRPSchemaSiriEventTypeUnion deleteMwtClientEvent](self, "deleteMwtClientEvent");
  -[GRPSchemaSiriEventTypeUnion homeClientEvent](self, "homeClientEvent");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "applySensitiveConditionsPolicy:", v4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "suppressMessage");

  if (v98)
    -[GRPSchemaSiriEventTypeUnion deleteHomeClientEvent](self, "deleteHomeClientEvent");
  -[GRPSchemaSiriEventTypeUnion gradingOptInStateChange](self, "gradingOptInStateChange");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "applySensitiveConditionsPolicy:", v4);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "suppressMessage");

  if (v101)
    -[GRPSchemaSiriEventTypeUnion deleteGradingOptInStateChange](self, "deleteGradingOptInStateChange");
  -[GRPSchemaSiriEventTypeUnion optinStatePropagationEvent](self, "optinStatePropagationEvent");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "applySensitiveConditionsPolicy:", v4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "suppressMessage");

  if (v104)
    -[GRPSchemaSiriEventTypeUnion deleteOptinStatePropagationEvent](self, "deleteOptinStatePropagationEvent");
  -[GRPSchemaSiriEventTypeUnion rssClientEvent](self, "rssClientEvent");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "applySensitiveConditionsPolicy:", v4);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "suppressMessage");

  if (v107)
    -[GRPSchemaSiriEventTypeUnion deleteRssClientEvent](self, "deleteRssClientEvent");
  -[GRPSchemaSiriEventTypeUnion sugClientEvent](self, "sugClientEvent");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "applySensitiveConditionsPolicy:", v4);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "suppressMessage");

  if (v110)
    -[GRPSchemaSiriEventTypeUnion deleteSugClientEvent](self, "deleteSugClientEvent");
  -[GRPSchemaSiriEventTypeUnion flowLinkClientEvent](self, "flowLinkClientEvent");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "applySensitiveConditionsPolicy:", v4);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "suppressMessage");

  if (v113)
    -[GRPSchemaSiriEventTypeUnion deleteFlowLinkClientEvent](self, "deleteFlowLinkClientEvent");
  -[GRPSchemaSiriEventTypeUnion rfClientEvent](self, "rfClientEvent");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "applySensitiveConditionsPolicy:", v4);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "suppressMessage");

  if (v116)
    -[GRPSchemaSiriEventTypeUnion deleteRfClientEvent](self, "deleteRfClientEvent");
  -[GRPSchemaSiriEventTypeUnion sicClientEvent](self, "sicClientEvent");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "applySensitiveConditionsPolicy:", v4);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "suppressMessage");

  if (v119)
    -[GRPSchemaSiriEventTypeUnion deleteSicClientEvent](self, "deleteSicClientEvent");
  -[GRPSchemaSiriEventTypeUnion inferenceClientEvent](self, "inferenceClientEvent");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "applySensitiveConditionsPolicy:", v4);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v121, "suppressMessage");

  if (v122)
    -[GRPSchemaSiriEventTypeUnion deleteInferenceClientEvent](self, "deleteInferenceClientEvent");
  -[GRPSchemaSiriEventTypeUnion caarClientEvent](self, "caarClientEvent");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "applySensitiveConditionsPolicy:", v4);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "suppressMessage");

  if (v125)
    -[GRPSchemaSiriEventTypeUnion deleteCaarClientEvent](self, "deleteCaarClientEvent");
  -[GRPSchemaSiriEventTypeUnion rfgClientEvent](self, "rfgClientEvent");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "applySensitiveConditionsPolicy:", v4);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v127, "suppressMessage");

  if (v128)
    -[GRPSchemaSiriEventTypeUnion deleteRfgClientEvent](self, "deleteRfgClientEvent");
  -[GRPSchemaSiriEventTypeUnion scClientEvent](self, "scClientEvent");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "applySensitiveConditionsPolicy:", v4);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "suppressMessage");

  if (v131)
    -[GRPSchemaSiriEventTypeUnion deleteScClientEvent](self, "deleteScClientEvent");
  -[GRPSchemaSiriEventTypeUnion siriSetupClientEvent](self, "siriSetupClientEvent");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "applySensitiveConditionsPolicy:", v4);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v133, "suppressMessage");

  if (v134)
    -[GRPSchemaSiriEventTypeUnion deleteSiriSetupClientEvent](self, "deleteSiriSetupClientEvent");
  -[GRPSchemaSiriEventTypeUnion optInClientEvent](self, "optInClientEvent");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "applySensitiveConditionsPolicy:", v4);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v136, "suppressMessage");

  if (v137)
    -[GRPSchemaSiriEventTypeUnion deleteOptInClientEvent](self, "deleteOptInClientEvent");
  -[GRPSchemaSiriEventTypeUnion lrClientEvent](self, "lrClientEvent");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "applySensitiveConditionsPolicy:", v4);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v139, "suppressMessage");

  if (v140)
    -[GRPSchemaSiriEventTypeUnion deleteLrClientEvent](self, "deleteLrClientEvent");
  -[GRPSchemaSiriEventTypeUnion homeKitClientEvent](self, "homeKitClientEvent");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "applySensitiveConditionsPolicy:", v4);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "suppressMessage");

  if (v143)
    -[GRPSchemaSiriEventTypeUnion deleteHomeKitClientEvent](self, "deleteHomeKitClientEvent");
  v144 = v5;

  return v144;
}

- (void)setUeiClientEvent:(id)a3
{
  SISchemaClientEvent *v4;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  SISchemaClientEvent *ueiClientEvent;

  v4 = (SISchemaClientEvent *)a3;
  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  self->_whichEvent_Type = v4 != 0;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = v4;

}

- (SISchemaClientEvent)ueiClientEvent
{
  if (self->_whichEvent_Type == 1)
    return self->_ueiClientEvent;
  else
    return (SISchemaClientEvent *)0;
}

- (void)deleteUeiClientEvent
{
  SISchemaClientEvent *ueiClientEvent;

  if (self->_whichEvent_Type == 1)
  {
    self->_whichEvent_Type = 0;
    ueiClientEvent = self->_ueiClientEvent;
    self->_ueiClientEvent = 0;

  }
}

- (void)setPetUploadEvent:(id)a3
{
  PETSchemaPETUpload *v4;
  SISchemaClientEvent *ueiClientEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  PETSchemaPETUpload *petUploadEvent;

  v4 = (PETSchemaPETUpload *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = v4;

}

- (PETSchemaPETUpload)petUploadEvent
{
  if (self->_whichEvent_Type == 2)
    return self->_petUploadEvent;
  else
    return (PETSchemaPETUpload *)0;
}

- (void)deletePetUploadEvent
{
  PETSchemaPETUpload *petUploadEvent;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    petUploadEvent = self->_petUploadEvent;
    self->_petUploadEvent = 0;

  }
}

- (void)setProvisionalEvent:(id)a3
{
  SISchemaProvisionalEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  SISchemaProvisionalEvent *provisionalEvent;

  v4 = (SISchemaProvisionalEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 3;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = v4;

}

- (SISchemaProvisionalEvent)provisionalEvent
{
  if (self->_whichEvent_Type == 3)
    return self->_provisionalEvent;
  else
    return (SISchemaProvisionalEvent *)0;
}

- (void)deleteProvisionalEvent
{
  SISchemaProvisionalEvent *provisionalEvent;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    provisionalEvent = self->_provisionalEvent;
    self->_provisionalEvent = 0;

  }
}

- (void)setTestExecutionEvent:(id)a3
{
  SUTSchemaTestExecutionEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;

  v4 = (SUTSchemaTestExecutionEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = v4;

}

- (SUTSchemaTestExecutionEvent)testExecutionEvent
{
  if (self->_whichEvent_Type == 4)
    return self->_testExecutionEvent;
  else
    return (SUTSchemaTestExecutionEvent *)0;
}

- (void)deleteTestExecutionEvent
{
  SUTSchemaTestExecutionEvent *testExecutionEvent;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    testExecutionEvent = self->_testExecutionEvent;
    self->_testExecutionEvent = 0;

  }
}

- (void)setRequestLinkEvent:(id)a3
{
  SISchemaRequestLink *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  SISchemaRequestLink *requestLinkEvent;

  v4 = (SISchemaRequestLink *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 5;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = v4;

}

- (SISchemaRequestLink)requestLinkEvent
{
  if (self->_whichEvent_Type == 5)
    return self->_requestLinkEvent;
  else
    return (SISchemaRequestLink *)0;
}

- (void)deleteRequestLinkEvent
{
  SISchemaRequestLink *requestLinkEvent;

  if (self->_whichEvent_Type == 5)
  {
    self->_whichEvent_Type = 0;
    requestLinkEvent = self->_requestLinkEvent;
    self->_requestLinkEvent = 0;

  }
}

- (void)setFlowClientEvent:(id)a3
{
  FLOWSchemaFLOWClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  FLOWSchemaFLOWClientEvent *flowClientEvent;

  v4 = (FLOWSchemaFLOWClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 6;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = v4;

}

- (FLOWSchemaFLOWClientEvent)flowClientEvent
{
  if (self->_whichEvent_Type == 6)
    return self->_flowClientEvent;
  else
    return (FLOWSchemaFLOWClientEvent *)0;
}

- (void)deleteFlowClientEvent
{
  FLOWSchemaFLOWClientEvent *flowClientEvent;

  if (self->_whichEvent_Type == 6)
  {
    self->_whichEvent_Type = 0;
    flowClientEvent = self->_flowClientEvent;
    self->_flowClientEvent = 0;

  }
}

- (void)setCamClientEvent:(id)a3
{
  CAMSchemaCAMClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  CAMSchemaCAMClientEvent *camClientEvent;

  v4 = (CAMSchemaCAMClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 7;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = v4;

}

- (CAMSchemaCAMClientEvent)camClientEvent
{
  if (self->_whichEvent_Type == 7)
    return self->_camClientEvent;
  else
    return (CAMSchemaCAMClientEvent *)0;
}

- (void)deleteCamClientEvent
{
  CAMSchemaCAMClientEvent *camClientEvent;

  if (self->_whichEvent_Type == 7)
  {
    self->_whichEvent_Type = 0;
    camClientEvent = self->_camClientEvent;
    self->_camClientEvent = 0;

  }
}

- (void)setUspClientEvent:(id)a3
{
  USPSchemaUSPClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;

  v4 = (USPSchemaUSPClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  self->_whichEvent_Type = 8 * (v4 != 0);
  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = v4;

}

- (USPSchemaUSPClientEvent)uspClientEvent
{
  if (self->_whichEvent_Type == 8)
    return self->_uspClientEvent;
  else
    return (USPSchemaUSPClientEvent *)0;
}

- (void)deleteUspClientEvent
{
  USPSchemaUSPClientEvent *uspClientEvent;

  if (self->_whichEvent_Type == 8)
  {
    self->_whichEvent_Type = 0;
    uspClientEvent = self->_uspClientEvent;
    self->_uspClientEvent = 0;

  }
}

- (void)setDimClientEvent:(id)a3
{
  DIMSchemaDIMClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  DIMSchemaDIMClientEvent *dimClientEvent;

  v4 = (DIMSchemaDIMClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 9;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = v4;

}

- (DIMSchemaDIMClientEvent)dimClientEvent
{
  if (self->_whichEvent_Type == 9)
    return self->_dimClientEvent;
  else
    return (DIMSchemaDIMClientEvent *)0;
}

- (void)deleteDimClientEvent
{
  DIMSchemaDIMClientEvent *dimClientEvent;

  if (self->_whichEvent_Type == 9)
  {
    self->_whichEvent_Type = 0;
    dimClientEvent = self->_dimClientEvent;
    self->_dimClientEvent = 0;

  }
}

- (void)setNlxClientEvent:(id)a3
{
  NLXSchemaNLXClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  NLXSchemaNLXClientEvent *nlxClientEvent;

  v4 = (NLXSchemaNLXClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 10;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = v4;

}

- (NLXSchemaNLXClientEvent)nlxClientEvent
{
  if (self->_whichEvent_Type == 10)
    return self->_nlxClientEvent;
  else
    return (NLXSchemaNLXClientEvent *)0;
}

- (void)deleteNlxClientEvent
{
  NLXSchemaNLXClientEvent *nlxClientEvent;

  if (self->_whichEvent_Type == 10)
  {
    self->_whichEvent_Type = 0;
    nlxClientEvent = self->_nlxClientEvent;
    self->_nlxClientEvent = 0;

  }
}

- (void)setOrchClientEvent:(id)a3
{
  ORCHSchemaORCHClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  ORCHSchemaORCHClientEvent *orchClientEvent;

  v4 = (ORCHSchemaORCHClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 11;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = v4;

}

- (ORCHSchemaORCHClientEvent)orchClientEvent
{
  if (self->_whichEvent_Type == 11)
    return self->_orchClientEvent;
  else
    return (ORCHSchemaORCHClientEvent *)0;
}

- (void)deleteOrchClientEvent
{
  ORCHSchemaORCHClientEvent *orchClientEvent;

  if (self->_whichEvent_Type == 11)
  {
    self->_whichEvent_Type = 0;
    orchClientEvent = self->_orchClientEvent;
    self->_orchClientEvent = 0;

  }
}

- (void)setAsrClientEvent:(id)a3
{
  ASRSchemaASRClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  ASRSchemaASRClientEvent *asrClientEvent;

  v4 = (ASRSchemaASRClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 12;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = v4;

}

- (ASRSchemaASRClientEvent)asrClientEvent
{
  if (self->_whichEvent_Type == 12)
    return self->_asrClientEvent;
  else
    return (ASRSchemaASRClientEvent *)0;
}

- (void)deleteAsrClientEvent
{
  ASRSchemaASRClientEvent *asrClientEvent;

  if (self->_whichEvent_Type == 12)
  {
    self->_whichEvent_Type = 0;
    asrClientEvent = self->_asrClientEvent;
    self->_asrClientEvent = 0;

  }
}

- (void)setIhClientEvent:(id)a3
{
  IHSchemaIHClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  IHSchemaIHClientEvent *ihClientEvent;

  v4 = (IHSchemaIHClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 13;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = v4;

}

- (IHSchemaIHClientEvent)ihClientEvent
{
  if (self->_whichEvent_Type == 13)
    return self->_ihClientEvent;
  else
    return (IHSchemaIHClientEvent *)0;
}

- (void)deleteIhClientEvent
{
  IHSchemaIHClientEvent *ihClientEvent;

  if (self->_whichEvent_Type == 13)
  {
    self->_whichEvent_Type = 0;
    ihClientEvent = self->_ihClientEvent;
    self->_ihClientEvent = 0;

  }
}

- (void)setMhClientEvent:(id)a3
{
  MHSchemaMHClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  MHSchemaMHClientEvent *mhClientEvent;

  v4 = (MHSchemaMHClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 14;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = v4;

}

- (MHSchemaMHClientEvent)mhClientEvent
{
  if (self->_whichEvent_Type == 14)
    return self->_mhClientEvent;
  else
    return (MHSchemaMHClientEvent *)0;
}

- (void)deleteMhClientEvent
{
  MHSchemaMHClientEvent *mhClientEvent;

  if (self->_whichEvent_Type == 14)
  {
    self->_whichEvent_Type = 0;
    mhClientEvent = self->_mhClientEvent;
    self->_mhClientEvent = 0;

  }
}

- (void)setTtsClientEvent:(id)a3
{
  TTSSchemaTTSClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  TTSSchemaTTSClientEvent *ttsClientEvent;

  v4 = (TTSSchemaTTSClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 15;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = v4;

}

- (TTSSchemaTTSClientEvent)ttsClientEvent
{
  if (self->_whichEvent_Type == 15)
    return self->_ttsClientEvent;
  else
    return (TTSSchemaTTSClientEvent *)0;
}

- (void)deleteTtsClientEvent
{
  TTSSchemaTTSClientEvent *ttsClientEvent;

  if (self->_whichEvent_Type == 15)
  {
    self->_whichEvent_Type = 0;
    ttsClientEvent = self->_ttsClientEvent;
    self->_ttsClientEvent = 0;

  }
}

- (void)setClpClientEvent:(id)a3
{
  CLPInstSchemaCLPClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;

  v4 = (CLPInstSchemaCLPClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  self->_whichEvent_Type = 16 * (v4 != 0);
  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = v4;

}

- (CLPInstSchemaCLPClientEvent)clpClientEvent
{
  if (self->_whichEvent_Type == 16)
    return self->_clpClientEvent;
  else
    return (CLPInstSchemaCLPClientEvent *)0;
}

- (void)deleteClpClientEvent
{
  CLPInstSchemaCLPClientEvent *clpClientEvent;

  if (self->_whichEvent_Type == 16)
  {
    self->_whichEvent_Type = 0;
    clpClientEvent = self->_clpClientEvent;
    self->_clpClientEvent = 0;

  }
}

- (void)setRrClientEvent:(id)a3
{
  RRSchemaRRClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  RRSchemaRRClientEvent *rrClientEvent;

  v4 = (RRSchemaRRClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 17;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = v4;

}

- (RRSchemaRRClientEvent)rrClientEvent
{
  if (self->_whichEvent_Type == 17)
    return self->_rrClientEvent;
  else
    return (RRSchemaRRClientEvent *)0;
}

- (void)deleteRrClientEvent
{
  RRSchemaRRClientEvent *rrClientEvent;

  if (self->_whichEvent_Type == 17)
  {
    self->_whichEvent_Type = 0;
    rrClientEvent = self->_rrClientEvent;
    self->_rrClientEvent = 0;

  }
}

- (void)setCnvClientEvent:(id)a3
{
  CNVSchemaCNVClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  CNVSchemaCNVClientEvent *cnvClientEvent;

  v4 = (CNVSchemaCNVClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 18;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = v4;

}

- (CNVSchemaCNVClientEvent)cnvClientEvent
{
  if (self->_whichEvent_Type == 18)
    return self->_cnvClientEvent;
  else
    return (CNVSchemaCNVClientEvent *)0;
}

- (void)deleteCnvClientEvent
{
  CNVSchemaCNVClientEvent *cnvClientEvent;

  if (self->_whichEvent_Type == 18)
  {
    self->_whichEvent_Type = 0;
    cnvClientEvent = self->_cnvClientEvent;
    self->_cnvClientEvent = 0;

  }
}

- (void)setAncClientEvent:(id)a3
{
  ANCSchemaANCClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  ANCSchemaANCClientEvent *ancClientEvent;

  v4 = (ANCSchemaANCClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 19;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = v4;

}

- (ANCSchemaANCClientEvent)ancClientEvent
{
  if (self->_whichEvent_Type == 19)
    return self->_ancClientEvent;
  else
    return (ANCSchemaANCClientEvent *)0;
}

- (void)deleteAncClientEvent
{
  ANCSchemaANCClientEvent *ancClientEvent;

  if (self->_whichEvent_Type == 19)
  {
    self->_whichEvent_Type = 0;
    ancClientEvent = self->_ancClientEvent;
    self->_ancClientEvent = 0;

  }
}

- (void)setHalClientEvent:(id)a3
{
  HALSchemaHALClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  HALSchemaHALClientEvent *halClientEvent;

  v4 = (HALSchemaHALClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 20;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = v4;

}

- (HALSchemaHALClientEvent)halClientEvent
{
  if (self->_whichEvent_Type == 20)
    return self->_halClientEvent;
  else
    return (HALSchemaHALClientEvent *)0;
}

- (void)deleteHalClientEvent
{
  HALSchemaHALClientEvent *halClientEvent;

  if (self->_whichEvent_Type == 20)
  {
    self->_whichEvent_Type = 0;
    halClientEvent = self->_halClientEvent;
    self->_halClientEvent = 0;

  }
}

- (void)setNetClientEvent:(id)a3
{
  NETSchemaNETClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  NETSchemaNETClientEvent *netClientEvent;

  v4 = (NETSchemaNETClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 21;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = v4;

}

- (NETSchemaNETClientEvent)netClientEvent
{
  if (self->_whichEvent_Type == 21)
    return self->_netClientEvent;
  else
    return (NETSchemaNETClientEvent *)0;
}

- (void)deleteNetClientEvent
{
  NETSchemaNETClientEvent *netClientEvent;

  if (self->_whichEvent_Type == 21)
  {
    self->_whichEvent_Type = 0;
    netClientEvent = self->_netClientEvent;
    self->_netClientEvent = 0;

  }
}

- (void)setSadClientEvent:(id)a3
{
  SADSchemaSADClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  SADSchemaSADClientEvent *sadClientEvent;

  v4 = (SADSchemaSADClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 22;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = v4;

}

- (SADSchemaSADClientEvent)sadClientEvent
{
  if (self->_whichEvent_Type == 22)
    return self->_sadClientEvent;
  else
    return (SADSchemaSADClientEvent *)0;
}

- (void)deleteSadClientEvent
{
  SADSchemaSADClientEvent *sadClientEvent;

  if (self->_whichEvent_Type == 22)
  {
    self->_whichEvent_Type = 0;
    sadClientEvent = self->_sadClientEvent;
    self->_sadClientEvent = 0;

  }
}

- (void)setDodmlClientEvent:(id)a3
{
  DODMLSchemaDODMLClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;

  v4 = (DODMLSchemaDODMLClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 23;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = v4;

}

- (DODMLSchemaDODMLClientEvent)dodmlClientEvent
{
  if (self->_whichEvent_Type == 23)
    return self->_dodmlClientEvent;
  else
    return (DODMLSchemaDODMLClientEvent *)0;
}

- (void)deleteDodmlClientEvent
{
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;

  if (self->_whichEvent_Type == 23)
  {
    self->_whichEvent_Type = 0;
    dodmlClientEvent = self->_dodmlClientEvent;
    self->_dodmlClientEvent = 0;

  }
}

- (void)setPlusClientEvent:(id)a3
{
  PLUSSchemaPLUSClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  PLUSSchemaPLUSClientEvent *plusClientEvent;

  v4 = (PLUSSchemaPLUSClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 24;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = v4;

}

- (PLUSSchemaPLUSClientEvent)plusClientEvent
{
  if (self->_whichEvent_Type == 24)
    return self->_plusClientEvent;
  else
    return (PLUSSchemaPLUSClientEvent *)0;
}

- (void)deletePlusClientEvent
{
  PLUSSchemaPLUSClientEvent *plusClientEvent;

  if (self->_whichEvent_Type == 24)
  {
    self->_whichEvent_Type = 0;
    plusClientEvent = self->_plusClientEvent;
    self->_plusClientEvent = 0;

  }
}

- (void)setExpSearchClientEvent:(id)a3
{
  EXPSearchSchemaEXPSearchClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;

  v4 = (EXPSearchSchemaEXPSearchClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 25;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = v4;

}

- (EXPSearchSchemaEXPSearchClientEvent)expSearchClientEvent
{
  if (self->_whichEvent_Type == 25)
    return self->_expSearchClientEvent;
  else
    return (EXPSearchSchemaEXPSearchClientEvent *)0;
}

- (void)deleteExpSearchClientEvent
{
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;

  if (self->_whichEvent_Type == 25)
  {
    self->_whichEvent_Type = 0;
    expSearchClientEvent = self->_expSearchClientEvent;
    self->_expSearchClientEvent = 0;

  }
}

- (void)setExpSiriClientEvent:(id)a3
{
  EXPSiriSchemaEXPSiriClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;

  v4 = (EXPSiriSchemaEXPSiriClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 26;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = v4;

}

- (EXPSiriSchemaEXPSiriClientEvent)expSiriClientEvent
{
  if (self->_whichEvent_Type == 26)
    return self->_expSiriClientEvent;
  else
    return (EXPSiriSchemaEXPSiriClientEvent *)0;
}

- (void)deleteExpSiriClientEvent
{
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;

  if (self->_whichEvent_Type == 26)
  {
    self->_whichEvent_Type = 0;
    expSiriClientEvent = self->_expSiriClientEvent;
    self->_expSiriClientEvent = 0;

  }
}

- (void)setSrstClientEvent:(id)a3
{
  SRSTSchemaSRSTClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  SRSTSchemaSRSTClientEvent *srstClientEvent;

  v4 = (SRSTSchemaSRSTClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 27;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = v4;

}

- (SRSTSchemaSRSTClientEvent)srstClientEvent
{
  if (self->_whichEvent_Type == 27)
    return self->_srstClientEvent;
  else
    return (SRSTSchemaSRSTClientEvent *)0;
}

- (void)deleteSrstClientEvent
{
  SRSTSchemaSRSTClientEvent *srstClientEvent;

  if (self->_whichEvent_Type == 27)
  {
    self->_whichEvent_Type = 0;
    srstClientEvent = self->_srstClientEvent;
    self->_srstClientEvent = 0;

  }
}

- (void)setPommmesClientEvent:(id)a3
{
  POMMESSchemaPOMMESClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;

  v4 = (POMMESSchemaPOMMESClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 28;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = v4;

}

- (POMMESSchemaPOMMESClientEvent)pommmesClientEvent
{
  if (self->_whichEvent_Type == 28)
    return self->_pommmesClientEvent;
  else
    return (POMMESSchemaPOMMESClientEvent *)0;
}

- (void)deletePommmesClientEvent
{
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;

  if (self->_whichEvent_Type == 28)
  {
    self->_whichEvent_Type = 0;
    pommmesClientEvent = self->_pommmesClientEvent;
    self->_pommmesClientEvent = 0;

  }
}

- (void)setCdaClientEvent:(id)a3
{
  CDASchemaCDAClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  CDASchemaCDAClientEvent *cdaClientEvent;

  v4 = (CDASchemaCDAClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 29;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = v4;

}

- (CDASchemaCDAClientEvent)cdaClientEvent
{
  if (self->_whichEvent_Type == 29)
    return self->_cdaClientEvent;
  else
    return (CDASchemaCDAClientEvent *)0;
}

- (void)deleteCdaClientEvent
{
  CDASchemaCDAClientEvent *cdaClientEvent;

  if (self->_whichEvent_Type == 29)
  {
    self->_whichEvent_Type = 0;
    cdaClientEvent = self->_cdaClientEvent;
    self->_cdaClientEvent = 0;

  }
}

- (void)setMwtClientEvent:(id)a3
{
  MWTSchemaMWTClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  MWTSchemaMWTClientEvent *mwtClientEvent;

  v4 = (MWTSchemaMWTClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 30;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = v4;

}

- (MWTSchemaMWTClientEvent)mwtClientEvent
{
  if (self->_whichEvent_Type == 30)
    return self->_mwtClientEvent;
  else
    return (MWTSchemaMWTClientEvent *)0;
}

- (void)deleteMwtClientEvent
{
  MWTSchemaMWTClientEvent *mwtClientEvent;

  if (self->_whichEvent_Type == 30)
  {
    self->_whichEvent_Type = 0;
    mwtClientEvent = self->_mwtClientEvent;
    self->_mwtClientEvent = 0;

  }
}

- (void)setHomeClientEvent:(id)a3
{
  HOMESchemaHOMEClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  HOMESchemaHOMEClientEvent *homeClientEvent;

  v4 = (HOMESchemaHOMEClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 31;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = v4;

}

- (HOMESchemaHOMEClientEvent)homeClientEvent
{
  if (self->_whichEvent_Type == 31)
    return self->_homeClientEvent;
  else
    return (HOMESchemaHOMEClientEvent *)0;
}

- (void)deleteHomeClientEvent
{
  HOMESchemaHOMEClientEvent *homeClientEvent;

  if (self->_whichEvent_Type == 31)
  {
    self->_whichEvent_Type = 0;
    homeClientEvent = self->_homeClientEvent;
    self->_homeClientEvent = 0;

  }
}

- (void)setGradingOptInStateChange:(id)a3
{
  SISchemaGradingOptInStateChange *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;

  v4 = (SISchemaGradingOptInStateChange *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  self->_whichEvent_Type = 32 * (v4 != 0);
  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = v4;

}

- (SISchemaGradingOptInStateChange)gradingOptInStateChange
{
  if (self->_whichEvent_Type == 32)
    return self->_gradingOptInStateChange;
  else
    return (SISchemaGradingOptInStateChange *)0;
}

- (void)deleteGradingOptInStateChange
{
  SISchemaGradingOptInStateChange *gradingOptInStateChange;

  if (self->_whichEvent_Type == 32)
  {
    self->_whichEvent_Type = 0;
    gradingOptInStateChange = self->_gradingOptInStateChange;
    self->_gradingOptInStateChange = 0;

  }
}

- (void)setOptinStatePropagationEvent:(id)a3
{
  OPTINSchemaOPTINStatePropagationEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;

  v4 = (OPTINSchemaOPTINStatePropagationEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 33;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = v4;

}

- (OPTINSchemaOPTINStatePropagationEvent)optinStatePropagationEvent
{
  if (self->_whichEvent_Type == 33)
    return self->_optinStatePropagationEvent;
  else
    return (OPTINSchemaOPTINStatePropagationEvent *)0;
}

- (void)deleteOptinStatePropagationEvent
{
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;

  if (self->_whichEvent_Type == 33)
  {
    self->_whichEvent_Type = 0;
    optinStatePropagationEvent = self->_optinStatePropagationEvent;
    self->_optinStatePropagationEvent = 0;

  }
}

- (void)setRssClientEvent:(id)a3
{
  RSSSchemaRSSClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  RSSSchemaRSSClientEvent *rssClientEvent;

  v4 = (RSSSchemaRSSClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 34;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = v4;

}

- (RSSSchemaRSSClientEvent)rssClientEvent
{
  if (self->_whichEvent_Type == 34)
    return self->_rssClientEvent;
  else
    return (RSSSchemaRSSClientEvent *)0;
}

- (void)deleteRssClientEvent
{
  RSSSchemaRSSClientEvent *rssClientEvent;

  if (self->_whichEvent_Type == 34)
  {
    self->_whichEvent_Type = 0;
    rssClientEvent = self->_rssClientEvent;
    self->_rssClientEvent = 0;

  }
}

- (void)setSugClientEvent:(id)a3
{
  SUGSchemaSUGClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  SUGSchemaSUGClientEvent *sugClientEvent;

  v4 = (SUGSchemaSUGClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 35;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = v4;

}

- (SUGSchemaSUGClientEvent)sugClientEvent
{
  if (self->_whichEvent_Type == 35)
    return self->_sugClientEvent;
  else
    return (SUGSchemaSUGClientEvent *)0;
}

- (void)deleteSugClientEvent
{
  SUGSchemaSUGClientEvent *sugClientEvent;

  if (self->_whichEvent_Type == 35)
  {
    self->_whichEvent_Type = 0;
    sugClientEvent = self->_sugClientEvent;
    self->_sugClientEvent = 0;

  }
}

- (void)setFlowLinkClientEvent:(id)a3
{
  FLOWLINKSchemaFLOWLINKClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;

  v4 = (FLOWLINKSchemaFLOWLINKClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 36;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = v4;

}

- (FLOWLINKSchemaFLOWLINKClientEvent)flowLinkClientEvent
{
  if (self->_whichEvent_Type == 36)
    return self->_flowLinkClientEvent;
  else
    return (FLOWLINKSchemaFLOWLINKClientEvent *)0;
}

- (void)deleteFlowLinkClientEvent
{
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;

  if (self->_whichEvent_Type == 36)
  {
    self->_whichEvent_Type = 0;
    flowLinkClientEvent = self->_flowLinkClientEvent;
    self->_flowLinkClientEvent = 0;

  }
}

- (void)setRfClientEvent:(id)a3
{
  RFSchemaRFClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  RFSchemaRFClientEvent *rfClientEvent;

  v4 = (RFSchemaRFClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 37;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = v4;

}

- (RFSchemaRFClientEvent)rfClientEvent
{
  if (self->_whichEvent_Type == 37)
    return self->_rfClientEvent;
  else
    return (RFSchemaRFClientEvent *)0;
}

- (void)deleteRfClientEvent
{
  RFSchemaRFClientEvent *rfClientEvent;

  if (self->_whichEvent_Type == 37)
  {
    self->_whichEvent_Type = 0;
    rfClientEvent = self->_rfClientEvent;
    self->_rfClientEvent = 0;

  }
}

- (void)setSicClientEvent:(id)a3
{
  SICSchemaSICClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  SICSchemaSICClientEvent *sicClientEvent;

  v4 = (SICSchemaSICClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 38;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = v4;

}

- (SICSchemaSICClientEvent)sicClientEvent
{
  if (self->_whichEvent_Type == 38)
    return self->_sicClientEvent;
  else
    return (SICSchemaSICClientEvent *)0;
}

- (void)deleteSicClientEvent
{
  SICSchemaSICClientEvent *sicClientEvent;

  if (self->_whichEvent_Type == 38)
  {
    self->_whichEvent_Type = 0;
    sicClientEvent = self->_sicClientEvent;
    self->_sicClientEvent = 0;

  }
}

- (void)setInferenceClientEvent:(id)a3
{
  INFERENCESchemaINFERENCEClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;

  v4 = (INFERENCESchemaINFERENCEClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 39;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = v4;

}

- (INFERENCESchemaINFERENCEClientEvent)inferenceClientEvent
{
  if (self->_whichEvent_Type == 39)
    return self->_inferenceClientEvent;
  else
    return (INFERENCESchemaINFERENCEClientEvent *)0;
}

- (void)deleteInferenceClientEvent
{
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;

  if (self->_whichEvent_Type == 39)
  {
    self->_whichEvent_Type = 0;
    inferenceClientEvent = self->_inferenceClientEvent;
    self->_inferenceClientEvent = 0;

  }
}

- (void)setCaarClientEvent:(id)a3
{
  CAARSchemaCAARClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  CAARSchemaCAARClientEvent *caarClientEvent;

  v4 = (CAARSchemaCAARClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 40;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = v4;

}

- (CAARSchemaCAARClientEvent)caarClientEvent
{
  if (self->_whichEvent_Type == 40)
    return self->_caarClientEvent;
  else
    return (CAARSchemaCAARClientEvent *)0;
}

- (void)deleteCaarClientEvent
{
  CAARSchemaCAARClientEvent *caarClientEvent;

  if (self->_whichEvent_Type == 40)
  {
    self->_whichEvent_Type = 0;
    caarClientEvent = self->_caarClientEvent;
    self->_caarClientEvent = 0;

  }
}

- (void)setRfgClientEvent:(id)a3
{
  RFGSchemaRFGClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  RFGSchemaRFGClientEvent *rfgClientEvent;

  v4 = (RFGSchemaRFGClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 41;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = v4;

}

- (RFGSchemaRFGClientEvent)rfgClientEvent
{
  if (self->_whichEvent_Type == 41)
    return self->_rfgClientEvent;
  else
    return (RFGSchemaRFGClientEvent *)0;
}

- (void)deleteRfgClientEvent
{
  RFGSchemaRFGClientEvent *rfgClientEvent;

  if (self->_whichEvent_Type == 41)
  {
    self->_whichEvent_Type = 0;
    rfgClientEvent = self->_rfgClientEvent;
    self->_rfgClientEvent = 0;

  }
}

- (void)setScClientEvent:(id)a3
{
  SCSchemaSCClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  SCSchemaSCClientEvent *scClientEvent;

  v4 = (SCSchemaSCClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 42;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = v4;

}

- (SCSchemaSCClientEvent)scClientEvent
{
  if (self->_whichEvent_Type == 42)
    return self->_scClientEvent;
  else
    return (SCSchemaSCClientEvent *)0;
}

- (void)deleteScClientEvent
{
  SCSchemaSCClientEvent *scClientEvent;

  if (self->_whichEvent_Type == 42)
  {
    self->_whichEvent_Type = 0;
    scClientEvent = self->_scClientEvent;
    self->_scClientEvent = 0;

  }
}

- (void)setSiriSetupClientEvent:(id)a3
{
  SIRISETUPSchemaSIRISETUPClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;

  v4 = (SIRISETUPSchemaSIRISETUPClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 43;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = v4;

}

- (SIRISETUPSchemaSIRISETUPClientEvent)siriSetupClientEvent
{
  if (self->_whichEvent_Type == 43)
    return self->_siriSetupClientEvent;
  else
    return (SIRISETUPSchemaSIRISETUPClientEvent *)0;
}

- (void)deleteSiriSetupClientEvent
{
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;

  if (self->_whichEvent_Type == 43)
  {
    self->_whichEvent_Type = 0;
    siriSetupClientEvent = self->_siriSetupClientEvent;
    self->_siriSetupClientEvent = 0;

  }
}

- (void)setOptInClientEvent:(id)a3
{
  OPTINSchemaOPTINClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  OPTINSchemaOPTINClientEvent *optInClientEvent;

  v4 = (OPTINSchemaOPTINClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 44;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = v4;

}

- (OPTINSchemaOPTINClientEvent)optInClientEvent
{
  if (self->_whichEvent_Type == 44)
    return self->_optInClientEvent;
  else
    return (OPTINSchemaOPTINClientEvent *)0;
}

- (void)deleteOptInClientEvent
{
  OPTINSchemaOPTINClientEvent *optInClientEvent;

  if (self->_whichEvent_Type == 44)
  {
    self->_whichEvent_Type = 0;
    optInClientEvent = self->_optInClientEvent;
    self->_optInClientEvent = 0;

  }
}

- (void)setLrClientEvent:(id)a3
{
  LRSchemaLRClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;
  unint64_t v50;
  LRSchemaLRClientEvent *lrClientEvent;

  v4 = (LRSchemaLRClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = 0;

  v50 = 45;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = v4;

}

- (LRSchemaLRClientEvent)lrClientEvent
{
  if (self->_whichEvent_Type == 45)
    return self->_lrClientEvent;
  else
    return (LRSchemaLRClientEvent *)0;
}

- (void)deleteLrClientEvent
{
  LRSchemaLRClientEvent *lrClientEvent;

  if (self->_whichEvent_Type == 45)
  {
    self->_whichEvent_Type = 0;
    lrClientEvent = self->_lrClientEvent;
    self->_lrClientEvent = 0;

  }
}

- (void)setHomeKitClientEvent:(id)a3
{
  HomeKitSchemaHKClientEvent *v4;
  SISchemaClientEvent *ueiClientEvent;
  PETSchemaPETUpload *petUploadEvent;
  SISchemaProvisionalEvent *provisionalEvent;
  SUTSchemaTestExecutionEvent *testExecutionEvent;
  SISchemaRequestLink *requestLinkEvent;
  FLOWSchemaFLOWClientEvent *flowClientEvent;
  CAMSchemaCAMClientEvent *camClientEvent;
  USPSchemaUSPClientEvent *uspClientEvent;
  DIMSchemaDIMClientEvent *dimClientEvent;
  NLXSchemaNLXClientEvent *nlxClientEvent;
  ORCHSchemaORCHClientEvent *orchClientEvent;
  ASRSchemaASRClientEvent *asrClientEvent;
  IHSchemaIHClientEvent *ihClientEvent;
  MHSchemaMHClientEvent *mhClientEvent;
  TTSSchemaTTSClientEvent *ttsClientEvent;
  CLPInstSchemaCLPClientEvent *clpClientEvent;
  RRSchemaRRClientEvent *rrClientEvent;
  CNVSchemaCNVClientEvent *cnvClientEvent;
  ANCSchemaANCClientEvent *ancClientEvent;
  HALSchemaHALClientEvent *halClientEvent;
  NETSchemaNETClientEvent *netClientEvent;
  SADSchemaSADClientEvent *sadClientEvent;
  DODMLSchemaDODMLClientEvent *dodmlClientEvent;
  PLUSSchemaPLUSClientEvent *plusClientEvent;
  EXPSearchSchemaEXPSearchClientEvent *expSearchClientEvent;
  EXPSiriSchemaEXPSiriClientEvent *expSiriClientEvent;
  SRSTSchemaSRSTClientEvent *srstClientEvent;
  POMMESSchemaPOMMESClientEvent *pommmesClientEvent;
  CDASchemaCDAClientEvent *cdaClientEvent;
  MWTSchemaMWTClientEvent *mwtClientEvent;
  HOMESchemaHOMEClientEvent *homeClientEvent;
  SISchemaGradingOptInStateChange *gradingOptInStateChange;
  OPTINSchemaOPTINStatePropagationEvent *optinStatePropagationEvent;
  RSSSchemaRSSClientEvent *rssClientEvent;
  SUGSchemaSUGClientEvent *sugClientEvent;
  FLOWLINKSchemaFLOWLINKClientEvent *flowLinkClientEvent;
  RFSchemaRFClientEvent *rfClientEvent;
  SICSchemaSICClientEvent *sicClientEvent;
  INFERENCESchemaINFERENCEClientEvent *inferenceClientEvent;
  CAARSchemaCAARClientEvent *caarClientEvent;
  RFGSchemaRFGClientEvent *rfgClientEvent;
  SCSchemaSCClientEvent *scClientEvent;
  SIRISETUPSchemaSIRISETUPClientEvent *siriSetupClientEvent;
  OPTINSchemaOPTINClientEvent *optInClientEvent;
  LRSchemaLRClientEvent *lrClientEvent;
  unint64_t v50;
  HomeKitSchemaHKClientEvent *homeKitClientEvent;

  v4 = (HomeKitSchemaHKClientEvent *)a3;
  ueiClientEvent = self->_ueiClientEvent;
  self->_ueiClientEvent = 0;

  petUploadEvent = self->_petUploadEvent;
  self->_petUploadEvent = 0;

  provisionalEvent = self->_provisionalEvent;
  self->_provisionalEvent = 0;

  testExecutionEvent = self->_testExecutionEvent;
  self->_testExecutionEvent = 0;

  requestLinkEvent = self->_requestLinkEvent;
  self->_requestLinkEvent = 0;

  flowClientEvent = self->_flowClientEvent;
  self->_flowClientEvent = 0;

  camClientEvent = self->_camClientEvent;
  self->_camClientEvent = 0;

  uspClientEvent = self->_uspClientEvent;
  self->_uspClientEvent = 0;

  dimClientEvent = self->_dimClientEvent;
  self->_dimClientEvent = 0;

  nlxClientEvent = self->_nlxClientEvent;
  self->_nlxClientEvent = 0;

  orchClientEvent = self->_orchClientEvent;
  self->_orchClientEvent = 0;

  asrClientEvent = self->_asrClientEvent;
  self->_asrClientEvent = 0;

  ihClientEvent = self->_ihClientEvent;
  self->_ihClientEvent = 0;

  mhClientEvent = self->_mhClientEvent;
  self->_mhClientEvent = 0;

  ttsClientEvent = self->_ttsClientEvent;
  self->_ttsClientEvent = 0;

  clpClientEvent = self->_clpClientEvent;
  self->_clpClientEvent = 0;

  rrClientEvent = self->_rrClientEvent;
  self->_rrClientEvent = 0;

  cnvClientEvent = self->_cnvClientEvent;
  self->_cnvClientEvent = 0;

  ancClientEvent = self->_ancClientEvent;
  self->_ancClientEvent = 0;

  halClientEvent = self->_halClientEvent;
  self->_halClientEvent = 0;

  netClientEvent = self->_netClientEvent;
  self->_netClientEvent = 0;

  sadClientEvent = self->_sadClientEvent;
  self->_sadClientEvent = 0;

  dodmlClientEvent = self->_dodmlClientEvent;
  self->_dodmlClientEvent = 0;

  plusClientEvent = self->_plusClientEvent;
  self->_plusClientEvent = 0;

  expSearchClientEvent = self->_expSearchClientEvent;
  self->_expSearchClientEvent = 0;

  expSiriClientEvent = self->_expSiriClientEvent;
  self->_expSiriClientEvent = 0;

  srstClientEvent = self->_srstClientEvent;
  self->_srstClientEvent = 0;

  pommmesClientEvent = self->_pommmesClientEvent;
  self->_pommmesClientEvent = 0;

  cdaClientEvent = self->_cdaClientEvent;
  self->_cdaClientEvent = 0;

  mwtClientEvent = self->_mwtClientEvent;
  self->_mwtClientEvent = 0;

  homeClientEvent = self->_homeClientEvent;
  self->_homeClientEvent = 0;

  gradingOptInStateChange = self->_gradingOptInStateChange;
  self->_gradingOptInStateChange = 0;

  optinStatePropagationEvent = self->_optinStatePropagationEvent;
  self->_optinStatePropagationEvent = 0;

  rssClientEvent = self->_rssClientEvent;
  self->_rssClientEvent = 0;

  sugClientEvent = self->_sugClientEvent;
  self->_sugClientEvent = 0;

  flowLinkClientEvent = self->_flowLinkClientEvent;
  self->_flowLinkClientEvent = 0;

  rfClientEvent = self->_rfClientEvent;
  self->_rfClientEvent = 0;

  sicClientEvent = self->_sicClientEvent;
  self->_sicClientEvent = 0;

  inferenceClientEvent = self->_inferenceClientEvent;
  self->_inferenceClientEvent = 0;

  caarClientEvent = self->_caarClientEvent;
  self->_caarClientEvent = 0;

  rfgClientEvent = self->_rfgClientEvent;
  self->_rfgClientEvent = 0;

  scClientEvent = self->_scClientEvent;
  self->_scClientEvent = 0;

  siriSetupClientEvent = self->_siriSetupClientEvent;
  self->_siriSetupClientEvent = 0;

  optInClientEvent = self->_optInClientEvent;
  self->_optInClientEvent = 0;

  lrClientEvent = self->_lrClientEvent;
  self->_lrClientEvent = 0;

  v50 = 46;
  if (!v4)
    v50 = 0;
  self->_whichEvent_Type = v50;
  homeKitClientEvent = self->_homeKitClientEvent;
  self->_homeKitClientEvent = v4;

}

- (HomeKitSchemaHKClientEvent)homeKitClientEvent
{
  if (self->_whichEvent_Type == 46)
    return self->_homeKitClientEvent;
  else
    return (HomeKitSchemaHKClientEvent *)0;
}

- (void)deleteHomeKitClientEvent
{
  HomeKitSchemaHKClientEvent *homeKitClientEvent;

  if (self->_whichEvent_Type == 46)
  {
    self->_whichEvent_Type = 0;
    homeKitClientEvent = self->_homeKitClientEvent;
    self->_homeKitClientEvent = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return GRPSchemaSiriEventTypeUnionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;

  v96 = a3;
  -[GRPSchemaSiriEventTypeUnion ueiClientEvent](self, "ueiClientEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GRPSchemaSiriEventTypeUnion ueiClientEvent](self, "ueiClientEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion petUploadEvent](self, "petUploadEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[GRPSchemaSiriEventTypeUnion petUploadEvent](self, "petUploadEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion provisionalEvent](self, "provisionalEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GRPSchemaSiriEventTypeUnion provisionalEvent](self, "provisionalEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion testExecutionEvent](self, "testExecutionEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GRPSchemaSiriEventTypeUnion testExecutionEvent](self, "testExecutionEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion requestLinkEvent](self, "requestLinkEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[GRPSchemaSiriEventTypeUnion requestLinkEvent](self, "requestLinkEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion flowClientEvent](self, "flowClientEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[GRPSchemaSiriEventTypeUnion flowClientEvent](self, "flowClientEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion camClientEvent](self, "camClientEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[GRPSchemaSiriEventTypeUnion camClientEvent](self, "camClientEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion uspClientEvent](self, "uspClientEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[GRPSchemaSiriEventTypeUnion uspClientEvent](self, "uspClientEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion dimClientEvent](self, "dimClientEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[GRPSchemaSiriEventTypeUnion dimClientEvent](self, "dimClientEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion nlxClientEvent](self, "nlxClientEvent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[GRPSchemaSiriEventTypeUnion nlxClientEvent](self, "nlxClientEvent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion orchClientEvent](self, "orchClientEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[GRPSchemaSiriEventTypeUnion orchClientEvent](self, "orchClientEvent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion asrClientEvent](self, "asrClientEvent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[GRPSchemaSiriEventTypeUnion asrClientEvent](self, "asrClientEvent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion ihClientEvent](self, "ihClientEvent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[GRPSchemaSiriEventTypeUnion ihClientEvent](self, "ihClientEvent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion mhClientEvent](self, "mhClientEvent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[GRPSchemaSiriEventTypeUnion mhClientEvent](self, "mhClientEvent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion ttsClientEvent](self, "ttsClientEvent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[GRPSchemaSiriEventTypeUnion ttsClientEvent](self, "ttsClientEvent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion clpClientEvent](self, "clpClientEvent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[GRPSchemaSiriEventTypeUnion clpClientEvent](self, "clpClientEvent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion rrClientEvent](self, "rrClientEvent");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[GRPSchemaSiriEventTypeUnion rrClientEvent](self, "rrClientEvent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion cnvClientEvent](self, "cnvClientEvent");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[GRPSchemaSiriEventTypeUnion cnvClientEvent](self, "cnvClientEvent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion ancClientEvent](self, "ancClientEvent");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[GRPSchemaSiriEventTypeUnion ancClientEvent](self, "ancClientEvent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion halClientEvent](self, "halClientEvent");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[GRPSchemaSiriEventTypeUnion halClientEvent](self, "halClientEvent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion netClientEvent](self, "netClientEvent");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[GRPSchemaSiriEventTypeUnion netClientEvent](self, "netClientEvent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion sadClientEvent](self, "sadClientEvent");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[GRPSchemaSiriEventTypeUnion sadClientEvent](self, "sadClientEvent");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion dodmlClientEvent](self, "dodmlClientEvent");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[GRPSchemaSiriEventTypeUnion dodmlClientEvent](self, "dodmlClientEvent");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion plusClientEvent](self, "plusClientEvent");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[GRPSchemaSiriEventTypeUnion plusClientEvent](self, "plusClientEvent");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion expSearchClientEvent](self, "expSearchClientEvent");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[GRPSchemaSiriEventTypeUnion expSearchClientEvent](self, "expSearchClientEvent");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion expSiriClientEvent](self, "expSiriClientEvent");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[GRPSchemaSiriEventTypeUnion expSiriClientEvent](self, "expSiriClientEvent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion srstClientEvent](self, "srstClientEvent");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[GRPSchemaSiriEventTypeUnion srstClientEvent](self, "srstClientEvent");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion pommmesClientEvent](self, "pommmesClientEvent");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[GRPSchemaSiriEventTypeUnion pommmesClientEvent](self, "pommmesClientEvent");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion cdaClientEvent](self, "cdaClientEvent");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[GRPSchemaSiriEventTypeUnion cdaClientEvent](self, "cdaClientEvent");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion mwtClientEvent](self, "mwtClientEvent");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[GRPSchemaSiriEventTypeUnion mwtClientEvent](self, "mwtClientEvent");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion homeClientEvent](self, "homeClientEvent");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[GRPSchemaSiriEventTypeUnion homeClientEvent](self, "homeClientEvent");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion gradingOptInStateChange](self, "gradingOptInStateChange");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[GRPSchemaSiriEventTypeUnion gradingOptInStateChange](self, "gradingOptInStateChange");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion optinStatePropagationEvent](self, "optinStatePropagationEvent");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[GRPSchemaSiriEventTypeUnion optinStatePropagationEvent](self, "optinStatePropagationEvent");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion rssClientEvent](self, "rssClientEvent");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[GRPSchemaSiriEventTypeUnion rssClientEvent](self, "rssClientEvent");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion sugClientEvent](self, "sugClientEvent");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[GRPSchemaSiriEventTypeUnion sugClientEvent](self, "sugClientEvent");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion flowLinkClientEvent](self, "flowLinkClientEvent");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[GRPSchemaSiriEventTypeUnion flowLinkClientEvent](self, "flowLinkClientEvent");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion rfClientEvent](self, "rfClientEvent");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    -[GRPSchemaSiriEventTypeUnion rfClientEvent](self, "rfClientEvent");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion sicClientEvent](self, "sicClientEvent");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    -[GRPSchemaSiriEventTypeUnion sicClientEvent](self, "sicClientEvent");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion inferenceClientEvent](self, "inferenceClientEvent");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    -[GRPSchemaSiriEventTypeUnion inferenceClientEvent](self, "inferenceClientEvent");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion caarClientEvent](self, "caarClientEvent");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    -[GRPSchemaSiriEventTypeUnion caarClientEvent](self, "caarClientEvent");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion rfgClientEvent](self, "rfgClientEvent");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    -[GRPSchemaSiriEventTypeUnion rfgClientEvent](self, "rfgClientEvent");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion scClientEvent](self, "scClientEvent");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    -[GRPSchemaSiriEventTypeUnion scClientEvent](self, "scClientEvent");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion siriSetupClientEvent](self, "siriSetupClientEvent");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    -[GRPSchemaSiriEventTypeUnion siriSetupClientEvent](self, "siriSetupClientEvent");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion optInClientEvent](self, "optInClientEvent");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    -[GRPSchemaSiriEventTypeUnion optInClientEvent](self, "optInClientEvent");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion lrClientEvent](self, "lrClientEvent");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    -[GRPSchemaSiriEventTypeUnion lrClientEvent](self, "lrClientEvent");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRPSchemaSiriEventTypeUnion homeKitClientEvent](self, "homeKitClientEvent");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    -[GRPSchemaSiriEventTypeUnion homeKitClientEvent](self, "homeKitClientEvent");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  int v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  int v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  int v177;
  uint64_t v178;
  void *v179;
  void *v180;
  void *v181;
  int v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  int v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  int v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  int v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  int v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  int v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  int v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  int v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  int v222;
  uint64_t v223;
  void *v224;
  void *v225;
  void *v226;
  int v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  int v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  char v237;
  BOOL v238;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_233;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_233;
  -[GRPSchemaSiriEventTypeUnion ueiClientEvent](self, "ueiClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ueiClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion ueiClientEvent](self, "ueiClientEvent");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[GRPSchemaSiriEventTypeUnion ueiClientEvent](self, "ueiClientEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ueiClientEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion petUploadEvent](self, "petUploadEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "petUploadEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion petUploadEvent](self, "petUploadEvent");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[GRPSchemaSiriEventTypeUnion petUploadEvent](self, "petUploadEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "petUploadEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion provisionalEvent](self, "provisionalEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisionalEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion provisionalEvent](self, "provisionalEvent");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[GRPSchemaSiriEventTypeUnion provisionalEvent](self, "provisionalEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provisionalEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion testExecutionEvent](self, "testExecutionEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testExecutionEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion testExecutionEvent](self, "testExecutionEvent");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[GRPSchemaSiriEventTypeUnion testExecutionEvent](self, "testExecutionEvent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testExecutionEvent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion requestLinkEvent](self, "requestLinkEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestLinkEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion requestLinkEvent](self, "requestLinkEvent");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[GRPSchemaSiriEventTypeUnion requestLinkEvent](self, "requestLinkEvent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestLinkEvent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion flowClientEvent](self, "flowClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion flowClientEvent](self, "flowClientEvent");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[GRPSchemaSiriEventTypeUnion flowClientEvent](self, "flowClientEvent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowClientEvent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion camClientEvent](self, "camClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "camClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion camClientEvent](self, "camClientEvent");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[GRPSchemaSiriEventTypeUnion camClientEvent](self, "camClientEvent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "camClientEvent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion uspClientEvent](self, "uspClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uspClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion uspClientEvent](self, "uspClientEvent");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[GRPSchemaSiriEventTypeUnion uspClientEvent](self, "uspClientEvent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uspClientEvent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion dimClientEvent](self, "dimClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dimClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion dimClientEvent](self, "dimClientEvent");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[GRPSchemaSiriEventTypeUnion dimClientEvent](self, "dimClientEvent");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dimClientEvent");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion nlxClientEvent](self, "nlxClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlxClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion nlxClientEvent](self, "nlxClientEvent");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[GRPSchemaSiriEventTypeUnion nlxClientEvent](self, "nlxClientEvent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlxClientEvent");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion orchClientEvent](self, "orchClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orchClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion orchClientEvent](self, "orchClientEvent");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[GRPSchemaSiriEventTypeUnion orchClientEvent](self, "orchClientEvent");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orchClientEvent");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion asrClientEvent](self, "asrClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion asrClientEvent](self, "asrClientEvent");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[GRPSchemaSiriEventTypeUnion asrClientEvent](self, "asrClientEvent");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrClientEvent");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion ihClientEvent](self, "ihClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ihClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion ihClientEvent](self, "ihClientEvent");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[GRPSchemaSiriEventTypeUnion ihClientEvent](self, "ihClientEvent");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ihClientEvent");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion mhClientEvent](self, "mhClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mhClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion mhClientEvent](self, "mhClientEvent");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[GRPSchemaSiriEventTypeUnion mhClientEvent](self, "mhClientEvent");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mhClientEvent");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion ttsClientEvent](self, "ttsClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ttsClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion ttsClientEvent](self, "ttsClientEvent");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[GRPSchemaSiriEventTypeUnion ttsClientEvent](self, "ttsClientEvent");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ttsClientEvent");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion clpClientEvent](self, "clpClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clpClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion clpClientEvent](self, "clpClientEvent");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[GRPSchemaSiriEventTypeUnion clpClientEvent](self, "clpClientEvent");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clpClientEvent");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion rrClientEvent](self, "rrClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rrClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion rrClientEvent](self, "rrClientEvent");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[GRPSchemaSiriEventTypeUnion rrClientEvent](self, "rrClientEvent");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rrClientEvent");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion cnvClientEvent](self, "cnvClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cnvClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion cnvClientEvent](self, "cnvClientEvent");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[GRPSchemaSiriEventTypeUnion cnvClientEvent](self, "cnvClientEvent");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cnvClientEvent");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion ancClientEvent](self, "ancClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ancClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion ancClientEvent](self, "ancClientEvent");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[GRPSchemaSiriEventTypeUnion ancClientEvent](self, "ancClientEvent");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ancClientEvent");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion halClientEvent](self, "halClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "halClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion halClientEvent](self, "halClientEvent");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[GRPSchemaSiriEventTypeUnion halClientEvent](self, "halClientEvent");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "halClientEvent");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion netClientEvent](self, "netClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "netClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion netClientEvent](self, "netClientEvent");
  v108 = objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)v108;
    -[GRPSchemaSiriEventTypeUnion netClientEvent](self, "netClientEvent");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "netClientEvent");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqual:", v111);

    if (!v112)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion sadClientEvent](self, "sadClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sadClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion sadClientEvent](self, "sadClientEvent");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    -[GRPSchemaSiriEventTypeUnion sadClientEvent](self, "sadClientEvent");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sadClientEvent");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v115, "isEqual:", v116);

    if (!v117)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion dodmlClientEvent](self, "dodmlClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dodmlClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion dodmlClientEvent](self, "dodmlClientEvent");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[GRPSchemaSiriEventTypeUnion dodmlClientEvent](self, "dodmlClientEvent");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dodmlClientEvent");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v120, "isEqual:", v121);

    if (!v122)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion plusClientEvent](self, "plusClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plusClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion plusClientEvent](self, "plusClientEvent");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    v124 = (void *)v123;
    -[GRPSchemaSiriEventTypeUnion plusClientEvent](self, "plusClientEvent");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plusClientEvent");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v125, "isEqual:", v126);

    if (!v127)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion expSearchClientEvent](self, "expSearchClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expSearchClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion expSearchClientEvent](self, "expSearchClientEvent");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[GRPSchemaSiriEventTypeUnion expSearchClientEvent](self, "expSearchClientEvent");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expSearchClientEvent");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v130, "isEqual:", v131);

    if (!v132)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion expSiriClientEvent](self, "expSiriClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expSiriClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion expSiriClientEvent](self, "expSiriClientEvent");
  v133 = objc_claimAutoreleasedReturnValue();
  if (v133)
  {
    v134 = (void *)v133;
    -[GRPSchemaSiriEventTypeUnion expSiriClientEvent](self, "expSiriClientEvent");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expSiriClientEvent");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v135, "isEqual:", v136);

    if (!v137)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion srstClientEvent](self, "srstClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srstClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion srstClientEvent](self, "srstClientEvent");
  v138 = objc_claimAutoreleasedReturnValue();
  if (v138)
  {
    v139 = (void *)v138;
    -[GRPSchemaSiriEventTypeUnion srstClientEvent](self, "srstClientEvent");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "srstClientEvent");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v140, "isEqual:", v141);

    if (!v142)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion pommmesClientEvent](self, "pommmesClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pommmesClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion pommmesClientEvent](self, "pommmesClientEvent");
  v143 = objc_claimAutoreleasedReturnValue();
  if (v143)
  {
    v144 = (void *)v143;
    -[GRPSchemaSiriEventTypeUnion pommmesClientEvent](self, "pommmesClientEvent");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pommmesClientEvent");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v145, "isEqual:", v146);

    if (!v147)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion cdaClientEvent](self, "cdaClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdaClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion cdaClientEvent](self, "cdaClientEvent");
  v148 = objc_claimAutoreleasedReturnValue();
  if (v148)
  {
    v149 = (void *)v148;
    -[GRPSchemaSiriEventTypeUnion cdaClientEvent](self, "cdaClientEvent");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdaClientEvent");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v150, "isEqual:", v151);

    if (!v152)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion mwtClientEvent](self, "mwtClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mwtClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion mwtClientEvent](self, "mwtClientEvent");
  v153 = objc_claimAutoreleasedReturnValue();
  if (v153)
  {
    v154 = (void *)v153;
    -[GRPSchemaSiriEventTypeUnion mwtClientEvent](self, "mwtClientEvent");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mwtClientEvent");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = objc_msgSend(v155, "isEqual:", v156);

    if (!v157)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion homeClientEvent](self, "homeClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion homeClientEvent](self, "homeClientEvent");
  v158 = objc_claimAutoreleasedReturnValue();
  if (v158)
  {
    v159 = (void *)v158;
    -[GRPSchemaSiriEventTypeUnion homeClientEvent](self, "homeClientEvent");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeClientEvent");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = objc_msgSend(v160, "isEqual:", v161);

    if (!v162)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion gradingOptInStateChange](self, "gradingOptInStateChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradingOptInStateChange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion gradingOptInStateChange](self, "gradingOptInStateChange");
  v163 = objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    v164 = (void *)v163;
    -[GRPSchemaSiriEventTypeUnion gradingOptInStateChange](self, "gradingOptInStateChange");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradingOptInStateChange");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v165, "isEqual:", v166);

    if (!v167)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion optinStatePropagationEvent](self, "optinStatePropagationEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optinStatePropagationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion optinStatePropagationEvent](self, "optinStatePropagationEvent");
  v168 = objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    v169 = (void *)v168;
    -[GRPSchemaSiriEventTypeUnion optinStatePropagationEvent](self, "optinStatePropagationEvent");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optinStatePropagationEvent");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v170, "isEqual:", v171);

    if (!v172)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion rssClientEvent](self, "rssClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rssClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion rssClientEvent](self, "rssClientEvent");
  v173 = objc_claimAutoreleasedReturnValue();
  if (v173)
  {
    v174 = (void *)v173;
    -[GRPSchemaSiriEventTypeUnion rssClientEvent](self, "rssClientEvent");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rssClientEvent");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v175, "isEqual:", v176);

    if (!v177)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion sugClientEvent](self, "sugClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sugClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion sugClientEvent](self, "sugClientEvent");
  v178 = objc_claimAutoreleasedReturnValue();
  if (v178)
  {
    v179 = (void *)v178;
    -[GRPSchemaSiriEventTypeUnion sugClientEvent](self, "sugClientEvent");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sugClientEvent");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend(v180, "isEqual:", v181);

    if (!v182)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion flowLinkClientEvent](self, "flowLinkClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowLinkClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion flowLinkClientEvent](self, "flowLinkClientEvent");
  v183 = objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    v184 = (void *)v183;
    -[GRPSchemaSiriEventTypeUnion flowLinkClientEvent](self, "flowLinkClientEvent");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowLinkClientEvent");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v185, "isEqual:", v186);

    if (!v187)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion rfClientEvent](self, "rfClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion rfClientEvent](self, "rfClientEvent");
  v188 = objc_claimAutoreleasedReturnValue();
  if (v188)
  {
    v189 = (void *)v188;
    -[GRPSchemaSiriEventTypeUnion rfClientEvent](self, "rfClientEvent");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfClientEvent");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(v190, "isEqual:", v191);

    if (!v192)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion sicClientEvent](self, "sicClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sicClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion sicClientEvent](self, "sicClientEvent");
  v193 = objc_claimAutoreleasedReturnValue();
  if (v193)
  {
    v194 = (void *)v193;
    -[GRPSchemaSiriEventTypeUnion sicClientEvent](self, "sicClientEvent");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sicClientEvent");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = objc_msgSend(v195, "isEqual:", v196);

    if (!v197)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion inferenceClientEvent](self, "inferenceClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inferenceClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion inferenceClientEvent](self, "inferenceClientEvent");
  v198 = objc_claimAutoreleasedReturnValue();
  if (v198)
  {
    v199 = (void *)v198;
    -[GRPSchemaSiriEventTypeUnion inferenceClientEvent](self, "inferenceClientEvent");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inferenceClientEvent");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend(v200, "isEqual:", v201);

    if (!v202)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion caarClientEvent](self, "caarClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caarClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion caarClientEvent](self, "caarClientEvent");
  v203 = objc_claimAutoreleasedReturnValue();
  if (v203)
  {
    v204 = (void *)v203;
    -[GRPSchemaSiriEventTypeUnion caarClientEvent](self, "caarClientEvent");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caarClientEvent");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = objc_msgSend(v205, "isEqual:", v206);

    if (!v207)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion rfgClientEvent](self, "rfgClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rfgClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion rfgClientEvent](self, "rfgClientEvent");
  v208 = objc_claimAutoreleasedReturnValue();
  if (v208)
  {
    v209 = (void *)v208;
    -[GRPSchemaSiriEventTypeUnion rfgClientEvent](self, "rfgClientEvent");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rfgClientEvent");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = objc_msgSend(v210, "isEqual:", v211);

    if (!v212)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion scClientEvent](self, "scClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion scClientEvent](self, "scClientEvent");
  v213 = objc_claimAutoreleasedReturnValue();
  if (v213)
  {
    v214 = (void *)v213;
    -[GRPSchemaSiriEventTypeUnion scClientEvent](self, "scClientEvent");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scClientEvent");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = objc_msgSend(v215, "isEqual:", v216);

    if (!v217)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion siriSetupClientEvent](self, "siriSetupClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSetupClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion siriSetupClientEvent](self, "siriSetupClientEvent");
  v218 = objc_claimAutoreleasedReturnValue();
  if (v218)
  {
    v219 = (void *)v218;
    -[GRPSchemaSiriEventTypeUnion siriSetupClientEvent](self, "siriSetupClientEvent");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriSetupClientEvent");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    v222 = objc_msgSend(v220, "isEqual:", v221);

    if (!v222)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion optInClientEvent](self, "optInClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optInClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion optInClientEvent](self, "optInClientEvent");
  v223 = objc_claimAutoreleasedReturnValue();
  if (v223)
  {
    v224 = (void *)v223;
    -[GRPSchemaSiriEventTypeUnion optInClientEvent](self, "optInClientEvent");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optInClientEvent");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v227 = objc_msgSend(v225, "isEqual:", v226);

    if (!v227)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion lrClientEvent](self, "lrClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lrClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_232;
  -[GRPSchemaSiriEventTypeUnion lrClientEvent](self, "lrClientEvent");
  v228 = objc_claimAutoreleasedReturnValue();
  if (v228)
  {
    v229 = (void *)v228;
    -[GRPSchemaSiriEventTypeUnion lrClientEvent](self, "lrClientEvent");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lrClientEvent");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = objc_msgSend(v230, "isEqual:", v231);

    if (!v232)
      goto LABEL_233;
  }
  else
  {

  }
  -[GRPSchemaSiriEventTypeUnion homeKitClientEvent](self, "homeKitClientEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitClientEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[GRPSchemaSiriEventTypeUnion homeKitClientEvent](self, "homeKitClientEvent");
    v233 = objc_claimAutoreleasedReturnValue();
    if (!v233)
    {

LABEL_236:
      v238 = 1;
      goto LABEL_234;
    }
    v234 = (void *)v233;
    -[GRPSchemaSiriEventTypeUnion homeKitClientEvent](self, "homeKitClientEvent");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeKitClientEvent");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v237 = objc_msgSend(v235, "isEqual:", v236);

    if ((v237 & 1) != 0)
      goto LABEL_236;
  }
  else
  {
LABEL_232:

  }
LABEL_233:
  v238 = 0;
LABEL_234:

  return v238;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;

  v3 = -[SISchemaClientEvent hash](self->_ueiClientEvent, "hash");
  v4 = -[PETSchemaPETUpload hash](self->_petUploadEvent, "hash") ^ v3;
  v5 = -[SISchemaProvisionalEvent hash](self->_provisionalEvent, "hash");
  v6 = v4 ^ v5 ^ -[SUTSchemaTestExecutionEvent hash](self->_testExecutionEvent, "hash");
  v7 = -[SISchemaRequestLink hash](self->_requestLinkEvent, "hash");
  v8 = v7 ^ -[FLOWSchemaFLOWClientEvent hash](self->_flowClientEvent, "hash");
  v9 = v6 ^ v8 ^ -[CAMSchemaCAMClientEvent hash](self->_camClientEvent, "hash");
  v10 = -[USPSchemaUSPClientEvent hash](self->_uspClientEvent, "hash");
  v11 = v10 ^ -[DIMSchemaDIMClientEvent hash](self->_dimClientEvent, "hash");
  v12 = v11 ^ -[NLXSchemaNLXClientEvent hash](self->_nlxClientEvent, "hash");
  v13 = v9 ^ v12 ^ -[ORCHSchemaORCHClientEvent hash](self->_orchClientEvent, "hash");
  v14 = -[ASRSchemaASRClientEvent hash](self->_asrClientEvent, "hash");
  v15 = v14 ^ -[IHSchemaIHClientEvent hash](self->_ihClientEvent, "hash");
  v16 = v15 ^ -[MHSchemaMHClientEvent hash](self->_mhClientEvent, "hash");
  v17 = v16 ^ -[TTSSchemaTTSClientEvent hash](self->_ttsClientEvent, "hash");
  v18 = v13 ^ v17 ^ -[CLPInstSchemaCLPClientEvent hash](self->_clpClientEvent, "hash");
  v19 = -[RRSchemaRRClientEvent hash](self->_rrClientEvent, "hash");
  v20 = v19 ^ -[CNVSchemaCNVClientEvent hash](self->_cnvClientEvent, "hash");
  v21 = v20 ^ -[ANCSchemaANCClientEvent hash](self->_ancClientEvent, "hash");
  v22 = v21 ^ -[HALSchemaHALClientEvent hash](self->_halClientEvent, "hash");
  v23 = v22 ^ -[NETSchemaNETClientEvent hash](self->_netClientEvent, "hash");
  v24 = v18 ^ v23 ^ -[SADSchemaSADClientEvent hash](self->_sadClientEvent, "hash");
  v25 = -[DODMLSchemaDODMLClientEvent hash](self->_dodmlClientEvent, "hash");
  v26 = v25 ^ -[PLUSSchemaPLUSClientEvent hash](self->_plusClientEvent, "hash");
  v27 = v26 ^ -[EXPSearchSchemaEXPSearchClientEvent hash](self->_expSearchClientEvent, "hash");
  v28 = v27 ^ -[EXPSiriSchemaEXPSiriClientEvent hash](self->_expSiriClientEvent, "hash");
  v29 = v28 ^ -[SRSTSchemaSRSTClientEvent hash](self->_srstClientEvent, "hash");
  v30 = v29 ^ -[POMMESSchemaPOMMESClientEvent hash](self->_pommmesClientEvent, "hash");
  v31 = v24 ^ v30 ^ -[CDASchemaCDAClientEvent hash](self->_cdaClientEvent, "hash");
  v32 = -[MWTSchemaMWTClientEvent hash](self->_mwtClientEvent, "hash");
  v33 = v32 ^ -[HOMESchemaHOMEClientEvent hash](self->_homeClientEvent, "hash");
  v34 = v33 ^ -[SISchemaGradingOptInStateChange hash](self->_gradingOptInStateChange, "hash");
  v35 = v34 ^ -[OPTINSchemaOPTINStatePropagationEvent hash](self->_optinStatePropagationEvent, "hash");
  v36 = v35 ^ -[RSSSchemaRSSClientEvent hash](self->_rssClientEvent, "hash");
  v37 = v36 ^ -[SUGSchemaSUGClientEvent hash](self->_sugClientEvent, "hash");
  v38 = v37 ^ -[FLOWLINKSchemaFLOWLINKClientEvent hash](self->_flowLinkClientEvent, "hash");
  v39 = v31 ^ v38 ^ -[RFSchemaRFClientEvent hash](self->_rfClientEvent, "hash");
  v40 = -[SICSchemaSICClientEvent hash](self->_sicClientEvent, "hash");
  v41 = v40 ^ -[INFERENCESchemaINFERENCEClientEvent hash](self->_inferenceClientEvent, "hash");
  v42 = v41 ^ -[CAARSchemaCAARClientEvent hash](self->_caarClientEvent, "hash");
  v43 = v42 ^ -[RFGSchemaRFGClientEvent hash](self->_rfgClientEvent, "hash");
  v44 = v43 ^ -[SCSchemaSCClientEvent hash](self->_scClientEvent, "hash");
  v45 = v44 ^ -[SIRISETUPSchemaSIRISETUPClientEvent hash](self->_siriSetupClientEvent, "hash");
  v46 = v45 ^ -[OPTINSchemaOPTINClientEvent hash](self->_optInClientEvent, "hash");
  v47 = v46 ^ -[LRSchemaLRClientEvent hash](self->_lrClientEvent, "hash");
  return v39 ^ v47 ^ -[HomeKitSchemaHKClientEvent hash](self->_homeKitClientEvent, "hash");
}

- (id)dictionaryRepresentation
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ancClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion ancClientEvent](self, "ancClientEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ancClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ancClientEvent"));

    }
  }
  if (self->_asrClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion asrClientEvent](self, "asrClientEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("asrClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("asrClientEvent"));

    }
  }
  if (self->_caarClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion caarClientEvent](self, "caarClientEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("caarClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("caarClientEvent"));

    }
  }
  if (self->_camClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion camClientEvent](self, "camClientEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("camClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("camClientEvent"));

    }
  }
  if (self->_cdaClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion cdaClientEvent](self, "cdaClientEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("cdaClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("cdaClientEvent"));

    }
  }
  if (self->_clpClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion clpClientEvent](self, "clpClientEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("clpClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("clpClientEvent"));

    }
  }
  if (self->_cnvClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion cnvClientEvent](self, "cnvClientEvent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("cnvClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("cnvClientEvent"));

    }
  }
  if (self->_dimClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion dimClientEvent](self, "dimClientEvent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("dimClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("dimClientEvent"));

    }
  }
  if (self->_dodmlClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion dodmlClientEvent](self, "dodmlClientEvent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("dodmlClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("dodmlClientEvent"));

    }
  }
  if (self->_expSearchClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion expSearchClientEvent](self, "expSearchClientEvent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("expSearchClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("expSearchClientEvent"));

    }
  }
  if (self->_expSiriClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion expSiriClientEvent](self, "expSiriClientEvent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("expSiriClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("expSiriClientEvent"));

    }
  }
  if (self->_flowClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion flowClientEvent](self, "flowClientEvent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("flowClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("flowClientEvent"));

    }
  }
  if (self->_flowLinkClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion flowLinkClientEvent](self, "flowLinkClientEvent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("flowLinkClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("flowLinkClientEvent"));

    }
  }
  if (self->_gradingOptInStateChange)
  {
    -[GRPSchemaSiriEventTypeUnion gradingOptInStateChange](self, "gradingOptInStateChange");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("gradingOptInStateChange"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("gradingOptInStateChange"));

    }
  }
  if (self->_halClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion halClientEvent](self, "halClientEvent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("halClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("halClientEvent"));

    }
  }
  if (self->_homeClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion homeClientEvent](self, "homeClientEvent");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("homeClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("homeClientEvent"));

    }
  }
  if (self->_homeKitClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion homeKitClientEvent](self, "homeKitClientEvent");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("homeKitClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("homeKitClientEvent"));

    }
  }
  if (self->_ihClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion ihClientEvent](self, "ihClientEvent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("ihClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("ihClientEvent"));

    }
  }
  if (self->_inferenceClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion inferenceClientEvent](self, "inferenceClientEvent");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("inferenceClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("inferenceClientEvent"));

    }
  }
  if (self->_lrClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion lrClientEvent](self, "lrClientEvent");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("lrClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("lrClientEvent"));

    }
  }
  if (self->_mhClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion mhClientEvent](self, "mhClientEvent");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("mhClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("mhClientEvent"));

    }
  }
  if (self->_mwtClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion mwtClientEvent](self, "mwtClientEvent");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("mwtClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("mwtClientEvent"));

    }
  }
  if (self->_netClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion netClientEvent](self, "netClientEvent");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("netClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("netClientEvent"));

    }
  }
  if (self->_nlxClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion nlxClientEvent](self, "nlxClientEvent");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("nlxClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("nlxClientEvent"));

    }
  }
  if (self->_optInClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion optInClientEvent](self, "optInClientEvent");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("optInClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("optInClientEvent"));

    }
  }
  if (self->_optinStatePropagationEvent)
  {
    -[GRPSchemaSiriEventTypeUnion optinStatePropagationEvent](self, "optinStatePropagationEvent");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("optinStatePropagationEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("optinStatePropagationEvent"));

    }
  }
  if (self->_orchClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion orchClientEvent](self, "orchClientEvent");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("orchClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("orchClientEvent"));

    }
  }
  if (self->_petUploadEvent)
  {
    -[GRPSchemaSiriEventTypeUnion petUploadEvent](self, "petUploadEvent");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("petUploadEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("petUploadEvent"));

    }
  }
  if (self->_plusClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion plusClientEvent](self, "plusClientEvent");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dictionaryRepresentation");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("plusClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("plusClientEvent"));

    }
  }
  if (self->_pommmesClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion pommmesClientEvent](self, "pommmesClientEvent");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "dictionaryRepresentation");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("pommmesClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("pommmesClientEvent"));

    }
  }
  if (self->_provisionalEvent)
  {
    -[GRPSchemaSiriEventTypeUnion provisionalEvent](self, "provisionalEvent");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "dictionaryRepresentation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("provisionalEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("provisionalEvent"));

    }
  }
  if (self->_requestLinkEvent)
  {
    -[GRPSchemaSiriEventTypeUnion requestLinkEvent](self, "requestLinkEvent");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "dictionaryRepresentation");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("requestLinkEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("requestLinkEvent"));

    }
  }
  if (self->_rfClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion rfClientEvent](self, "rfClientEvent");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "dictionaryRepresentation");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("rfClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("rfClientEvent"));

    }
  }
  if (self->_rfgClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion rfgClientEvent](self, "rfgClientEvent");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "dictionaryRepresentation");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("rfgClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("rfgClientEvent"));

    }
  }
  if (self->_rrClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion rrClientEvent](self, "rrClientEvent");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "dictionaryRepresentation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("rrClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("rrClientEvent"));

    }
  }
  if (self->_rssClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion rssClientEvent](self, "rssClientEvent");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "dictionaryRepresentation");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("rssClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("rssClientEvent"));

    }
  }
  if (self->_sadClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion sadClientEvent](self, "sadClientEvent");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "dictionaryRepresentation");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("sadClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("sadClientEvent"));

    }
  }
  if (self->_scClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion scClientEvent](self, "scClientEvent");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "dictionaryRepresentation");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("scClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("scClientEvent"));

    }
  }
  if (self->_sicClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion sicClientEvent](self, "sicClientEvent");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "dictionaryRepresentation");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("sicClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("sicClientEvent"));

    }
  }
  if (self->_siriSetupClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion siriSetupClientEvent](self, "siriSetupClientEvent");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "dictionaryRepresentation");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("siriSetupClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("siriSetupClientEvent"));

    }
  }
  if (self->_srstClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion srstClientEvent](self, "srstClientEvent");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "dictionaryRepresentation");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("srstClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v126, CFSTR("srstClientEvent"));

    }
  }
  if (self->_sugClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion sugClientEvent](self, "sugClientEvent");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "dictionaryRepresentation");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (v128)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("sugClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("sugClientEvent"));

    }
  }
  if (self->_testExecutionEvent)
  {
    -[GRPSchemaSiriEventTypeUnion testExecutionEvent](self, "testExecutionEvent");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "dictionaryRepresentation");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (v131)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("testExecutionEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v132, CFSTR("testExecutionEvent"));

    }
  }
  if (self->_ttsClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion ttsClientEvent](self, "ttsClientEvent");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "dictionaryRepresentation");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (v134)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v134, CFSTR("ttsClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v135, CFSTR("ttsClientEvent"));

    }
  }
  if (self->_ueiClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion ueiClientEvent](self, "ueiClientEvent");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "dictionaryRepresentation");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (v137)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v137, CFSTR("ueiClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v138, CFSTR("ueiClientEvent"));

    }
  }
  if (self->_uspClientEvent)
  {
    -[GRPSchemaSiriEventTypeUnion uspClientEvent](self, "uspClientEvent");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "dictionaryRepresentation");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    if (v140)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v140, CFSTR("uspClientEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v141, CFSTR("uspClientEvent"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v142 = v3;

  return v142;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRPSchemaSiriEventTypeUnion dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (GRPSchemaSiriEventTypeUnion)initWithJSON:(id)a3
{
  void *v4;
  GRPSchemaSiriEventTypeUnion *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[GRPSchemaSiriEventTypeUnion initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRPSchemaSiriEventTypeUnion)initWithDictionary:(id)a3
{
  id v4;
  GRPSchemaSiriEventTypeUnion *v5;
  uint64_t v6;
  SISchemaClientEvent *v7;
  uint64_t v8;
  PETSchemaPETUpload *v9;
  uint64_t v10;
  SISchemaProvisionalEvent *v11;
  uint64_t v12;
  SUTSchemaTestExecutionEvent *v13;
  uint64_t v14;
  SISchemaRequestLink *v15;
  uint64_t v16;
  FLOWSchemaFLOWClientEvent *v17;
  uint64_t v18;
  CAMSchemaCAMClientEvent *v19;
  uint64_t v20;
  USPSchemaUSPClientEvent *v21;
  uint64_t v22;
  DIMSchemaDIMClientEvent *v23;
  uint64_t v24;
  NLXSchemaNLXClientEvent *v25;
  uint64_t v26;
  ORCHSchemaORCHClientEvent *v27;
  uint64_t v28;
  ASRSchemaASRClientEvent *v29;
  uint64_t v30;
  IHSchemaIHClientEvent *v31;
  uint64_t v32;
  MHSchemaMHClientEvent *v33;
  uint64_t v34;
  TTSSchemaTTSClientEvent *v35;
  uint64_t v36;
  CLPInstSchemaCLPClientEvent *v37;
  uint64_t v38;
  RRSchemaRRClientEvent *v39;
  uint64_t v40;
  CNVSchemaCNVClientEvent *v41;
  uint64_t v42;
  ANCSchemaANCClientEvent *v43;
  uint64_t v44;
  HALSchemaHALClientEvent *v45;
  uint64_t v46;
  NETSchemaNETClientEvent *v47;
  uint64_t v48;
  SADSchemaSADClientEvent *v49;
  uint64_t v50;
  DODMLSchemaDODMLClientEvent *v51;
  uint64_t v52;
  PLUSSchemaPLUSClientEvent *v53;
  uint64_t v54;
  EXPSearchSchemaEXPSearchClientEvent *v55;
  uint64_t v56;
  EXPSiriSchemaEXPSiriClientEvent *v57;
  uint64_t v58;
  SRSTSchemaSRSTClientEvent *v59;
  uint64_t v60;
  POMMESSchemaPOMMESClientEvent *v61;
  uint64_t v62;
  CDASchemaCDAClientEvent *v63;
  uint64_t v64;
  MWTSchemaMWTClientEvent *v65;
  uint64_t v66;
  HOMESchemaHOMEClientEvent *v67;
  uint64_t v68;
  SISchemaGradingOptInStateChange *v69;
  uint64_t v70;
  OPTINSchemaOPTINStatePropagationEvent *v71;
  uint64_t v72;
  RSSSchemaRSSClientEvent *v73;
  uint64_t v74;
  SUGSchemaSUGClientEvent *v75;
  uint64_t v76;
  FLOWLINKSchemaFLOWLINKClientEvent *v77;
  uint64_t v78;
  RFSchemaRFClientEvent *v79;
  uint64_t v80;
  SICSchemaSICClientEvent *v81;
  uint64_t v82;
  INFERENCESchemaINFERENCEClientEvent *v83;
  void *v84;
  CAARSchemaCAARClientEvent *v85;
  void *v86;
  RFGSchemaRFGClientEvent *v87;
  void *v88;
  SCSchemaSCClientEvent *v89;
  void *v90;
  SIRISETUPSchemaSIRISETUPClientEvent *v91;
  void *v92;
  OPTINSchemaOPTINClientEvent *v93;
  void *v94;
  LRSchemaLRClientEvent *v95;
  void *v96;
  HomeKitSchemaHKClientEvent *v97;
  GRPSchemaSiriEventTypeUnion *v98;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  objc_super v139;

  v4 = a3;
  v139.receiver = self;
  v139.super_class = (Class)GRPSchemaSiriEventTypeUnion;
  v5 = -[GRPSchemaSiriEventTypeUnion init](&v139, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ueiClientEvent"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaClientEvent initWithDictionary:]([SISchemaClientEvent alloc], "initWithDictionary:", v6);
      -[GRPSchemaSiriEventTypeUnion setUeiClientEvent:](v5, "setUeiClientEvent:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("petUploadEvent"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PETSchemaPETUpload initWithDictionary:]([PETSchemaPETUpload alloc], "initWithDictionary:", v8);
      -[GRPSchemaSiriEventTypeUnion setPetUploadEvent:](v5, "setPetUploadEvent:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("provisionalEvent"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaProvisionalEvent initWithDictionary:]([SISchemaProvisionalEvent alloc], "initWithDictionary:", v10);
      -[GRPSchemaSiriEventTypeUnion setProvisionalEvent:](v5, "setProvisionalEvent:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testExecutionEvent"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SUTSchemaTestExecutionEvent initWithDictionary:]([SUTSchemaTestExecutionEvent alloc], "initWithDictionary:", v12);
      -[GRPSchemaSiriEventTypeUnion setTestExecutionEvent:](v5, "setTestExecutionEvent:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestLinkEvent"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaRequestLink initWithDictionary:]([SISchemaRequestLink alloc], "initWithDictionary:", v14);
      -[GRPSchemaSiriEventTypeUnion setRequestLinkEvent:](v5, "setRequestLinkEvent:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowClientEvent"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[FLOWSchemaFLOWClientEvent initWithDictionary:]([FLOWSchemaFLOWClientEvent alloc], "initWithDictionary:", v16);
      -[GRPSchemaSiriEventTypeUnion setFlowClientEvent:](v5, "setFlowClientEvent:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("camClientEvent"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v138 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[CAMSchemaCAMClientEvent initWithDictionary:]([CAMSchemaCAMClientEvent alloc], "initWithDictionary:", v18);
      -[GRPSchemaSiriEventTypeUnion setCamClientEvent:](v5, "setCamClientEvent:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uspClientEvent"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v137 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[USPSchemaUSPClientEvent initWithDictionary:]([USPSchemaUSPClientEvent alloc], "initWithDictionary:", v20);
      -[GRPSchemaSiriEventTypeUnion setUspClientEvent:](v5, "setUspClientEvent:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dimClientEvent"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v136 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[DIMSchemaDIMClientEvent initWithDictionary:]([DIMSchemaDIMClientEvent alloc], "initWithDictionary:", v22);
      -[GRPSchemaSiriEventTypeUnion setDimClientEvent:](v5, "setDimClientEvent:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlxClientEvent"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v135 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[NLXSchemaNLXClientEvent initWithDictionary:]([NLXSchemaNLXClientEvent alloc], "initWithDictionary:", v24);
      -[GRPSchemaSiriEventTypeUnion setNlxClientEvent:](v5, "setNlxClientEvent:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orchClientEvent"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v134 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[ORCHSchemaORCHClientEvent initWithDictionary:]([ORCHSchemaORCHClientEvent alloc], "initWithDictionary:", v26);
      -[GRPSchemaSiriEventTypeUnion setOrchClientEvent:](v5, "setOrchClientEvent:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrClientEvent"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v133 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[ASRSchemaASRClientEvent initWithDictionary:]([ASRSchemaASRClientEvent alloc], "initWithDictionary:", v28);
      -[GRPSchemaSiriEventTypeUnion setAsrClientEvent:](v5, "setAsrClientEvent:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ihClientEvent"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v132 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[IHSchemaIHClientEvent initWithDictionary:]([IHSchemaIHClientEvent alloc], "initWithDictionary:", v30);
      -[GRPSchemaSiriEventTypeUnion setIhClientEvent:](v5, "setIhClientEvent:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mhClientEvent"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v131 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[MHSchemaMHClientEvent initWithDictionary:]([MHSchemaMHClientEvent alloc], "initWithDictionary:", v32);
      -[GRPSchemaSiriEventTypeUnion setMhClientEvent:](v5, "setMhClientEvent:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttsClientEvent"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v130 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[TTSSchemaTTSClientEvent initWithDictionary:]([TTSSchemaTTSClientEvent alloc], "initWithDictionary:", v34);
      -[GRPSchemaSiriEventTypeUnion setTtsClientEvent:](v5, "setTtsClientEvent:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clpClientEvent"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v129 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[CLPInstSchemaCLPClientEvent initWithDictionary:]([CLPInstSchemaCLPClientEvent alloc], "initWithDictionary:", v36);
      -[GRPSchemaSiriEventTypeUnion setClpClientEvent:](v5, "setClpClientEvent:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rrClientEvent"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v128 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[RRSchemaRRClientEvent initWithDictionary:]([RRSchemaRRClientEvent alloc], "initWithDictionary:", v38);
      -[GRPSchemaSiriEventTypeUnion setRrClientEvent:](v5, "setRrClientEvent:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cnvClientEvent"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v127 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[CNVSchemaCNVClientEvent initWithDictionary:]([CNVSchemaCNVClientEvent alloc], "initWithDictionary:", v40);
      -[GRPSchemaSiriEventTypeUnion setCnvClientEvent:](v5, "setCnvClientEvent:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ancClientEvent"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v126 = (void *)v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[ANCSchemaANCClientEvent initWithDictionary:]([ANCSchemaANCClientEvent alloc], "initWithDictionary:", v42);
      -[GRPSchemaSiriEventTypeUnion setAncClientEvent:](v5, "setAncClientEvent:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("halClientEvent"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v125 = (void *)v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[HALSchemaHALClientEvent initWithDictionary:]([HALSchemaHALClientEvent alloc], "initWithDictionary:", v44);
      -[GRPSchemaSiriEventTypeUnion setHalClientEvent:](v5, "setHalClientEvent:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("netClientEvent"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v124 = (void *)v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[NETSchemaNETClientEvent initWithDictionary:]([NETSchemaNETClientEvent alloc], "initWithDictionary:", v46);
      -[GRPSchemaSiriEventTypeUnion setNetClientEvent:](v5, "setNetClientEvent:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sadClientEvent"));
    v48 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v123 = (void *)v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[SADSchemaSADClientEvent initWithDictionary:]([SADSchemaSADClientEvent alloc], "initWithDictionary:", v48);
      -[GRPSchemaSiriEventTypeUnion setSadClientEvent:](v5, "setSadClientEvent:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dodmlClientEvent"));
    v50 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v122 = (void *)v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[DODMLSchemaDODMLClientEvent initWithDictionary:]([DODMLSchemaDODMLClientEvent alloc], "initWithDictionary:", v50);
      -[GRPSchemaSiriEventTypeUnion setDodmlClientEvent:](v5, "setDodmlClientEvent:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plusClientEvent"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v121 = (void *)v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[PLUSSchemaPLUSClientEvent initWithDictionary:]([PLUSSchemaPLUSClientEvent alloc], "initWithDictionary:", v52);
      -[GRPSchemaSiriEventTypeUnion setPlusClientEvent:](v5, "setPlusClientEvent:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expSearchClientEvent"));
    v54 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v120 = (void *)v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[EXPSearchSchemaEXPSearchClientEvent initWithDictionary:]([EXPSearchSchemaEXPSearchClientEvent alloc], "initWithDictionary:", v54);
      -[GRPSchemaSiriEventTypeUnion setExpSearchClientEvent:](v5, "setExpSearchClientEvent:", v55);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expSiriClientEvent"));
    v56 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v119 = (void *)v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[EXPSiriSchemaEXPSiriClientEvent initWithDictionary:]([EXPSiriSchemaEXPSiriClientEvent alloc], "initWithDictionary:", v56);
      -[GRPSchemaSiriEventTypeUnion setExpSiriClientEvent:](v5, "setExpSiriClientEvent:", v57);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("srstClientEvent"));
    v58 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v118 = (void *)v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[SRSTSchemaSRSTClientEvent initWithDictionary:]([SRSTSchemaSRSTClientEvent alloc], "initWithDictionary:", v58);
      -[GRPSchemaSiriEventTypeUnion setSrstClientEvent:](v5, "setSrstClientEvent:", v59);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommmesClientEvent"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v117 = (void *)v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[POMMESSchemaPOMMESClientEvent initWithDictionary:]([POMMESSchemaPOMMESClientEvent alloc], "initWithDictionary:", v60);
      -[GRPSchemaSiriEventTypeUnion setPommmesClientEvent:](v5, "setPommmesClientEvent:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdaClientEvent"));
    v62 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v116 = (void *)v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[CDASchemaCDAClientEvent initWithDictionary:]([CDASchemaCDAClientEvent alloc], "initWithDictionary:", v62);
      -[GRPSchemaSiriEventTypeUnion setCdaClientEvent:](v5, "setCdaClientEvent:", v63);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mwtClientEvent"));
    v64 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v115 = (void *)v64;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[MWTSchemaMWTClientEvent initWithDictionary:]([MWTSchemaMWTClientEvent alloc], "initWithDictionary:", v64);
      -[GRPSchemaSiriEventTypeUnion setMwtClientEvent:](v5, "setMwtClientEvent:", v65);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeClientEvent"));
    v66 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = (void *)v66;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[HOMESchemaHOMEClientEvent initWithDictionary:]([HOMESchemaHOMEClientEvent alloc], "initWithDictionary:", v66);
      -[GRPSchemaSiriEventTypeUnion setHomeClientEvent:](v5, "setHomeClientEvent:", v67);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gradingOptInStateChange"));
    v68 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v113 = (void *)v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[SISchemaGradingOptInStateChange initWithDictionary:]([SISchemaGradingOptInStateChange alloc], "initWithDictionary:", v68);
      -[GRPSchemaSiriEventTypeUnion setGradingOptInStateChange:](v5, "setGradingOptInStateChange:", v69);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optinStatePropagationEvent"));
    v70 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v112 = (void *)v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = -[OPTINSchemaOPTINStatePropagationEvent initWithDictionary:]([OPTINSchemaOPTINStatePropagationEvent alloc], "initWithDictionary:", v70);
      -[GRPSchemaSiriEventTypeUnion setOptinStatePropagationEvent:](v5, "setOptinStatePropagationEvent:", v71);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rssClientEvent"));
    v72 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v111 = (void *)v72;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = -[RSSSchemaRSSClientEvent initWithDictionary:]([RSSSchemaRSSClientEvent alloc], "initWithDictionary:", v72);
      -[GRPSchemaSiriEventTypeUnion setRssClientEvent:](v5, "setRssClientEvent:", v73);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sugClientEvent"));
    v74 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v110 = (void *)v74;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = -[SUGSchemaSUGClientEvent initWithDictionary:]([SUGSchemaSUGClientEvent alloc], "initWithDictionary:", v74);
      -[GRPSchemaSiriEventTypeUnion setSugClientEvent:](v5, "setSugClientEvent:", v75);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowLinkClientEvent"));
    v76 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = (void *)v76;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = -[FLOWLINKSchemaFLOWLINKClientEvent initWithDictionary:]([FLOWLINKSchemaFLOWLINKClientEvent alloc], "initWithDictionary:", v76);
      -[GRPSchemaSiriEventTypeUnion setFlowLinkClientEvent:](v5, "setFlowLinkClientEvent:", v77);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfClientEvent"));
    v78 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = (void *)v78;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v79 = -[RFSchemaRFClientEvent initWithDictionary:]([RFSchemaRFClientEvent alloc], "initWithDictionary:", v78);
      -[GRPSchemaSiriEventTypeUnion setRfClientEvent:](v5, "setRfClientEvent:", v79);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sicClientEvent"));
    v80 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v107 = (void *)v80;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v81 = -[SICSchemaSICClientEvent initWithDictionary:]([SICSchemaSICClientEvent alloc], "initWithDictionary:", v80);
      -[GRPSchemaSiriEventTypeUnion setSicClientEvent:](v5, "setSicClientEvent:", v81);

    }
    v101 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferenceClientEvent"));
    v82 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = -[INFERENCESchemaINFERENCEClientEvent initWithDictionary:]([INFERENCESchemaINFERENCEClientEvent alloc], "initWithDictionary:", v82);
      -[GRPSchemaSiriEventTypeUnion setInferenceClientEvent:](v5, "setInferenceClientEvent:", v83);

    }
    v106 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("caarClientEvent"), v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v85 = -[CAARSchemaCAARClientEvent initWithDictionary:]([CAARSchemaCAARClientEvent alloc], "initWithDictionary:", v84);
      -[GRPSchemaSiriEventTypeUnion setCaarClientEvent:](v5, "setCaarClientEvent:", v85);

    }
    v105 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rfgClientEvent"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v87 = -[RFGSchemaRFGClientEvent initWithDictionary:]([RFGSchemaRFGClientEvent alloc], "initWithDictionary:", v86);
      -[GRPSchemaSiriEventTypeUnion setRfgClientEvent:](v5, "setRfgClientEvent:", v87);

    }
    v104 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scClientEvent"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v89 = -[SCSchemaSCClientEvent initWithDictionary:]([SCSchemaSCClientEvent alloc], "initWithDictionary:", v88);
      -[GRPSchemaSiriEventTypeUnion setScClientEvent:](v5, "setScClientEvent:", v89);

    }
    v103 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSetupClientEvent"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v91 = -[SIRISETUPSchemaSIRISETUPClientEvent initWithDictionary:]([SIRISETUPSchemaSIRISETUPClientEvent alloc], "initWithDictionary:", v90);
      -[GRPSchemaSiriEventTypeUnion setSiriSetupClientEvent:](v5, "setSiriSetupClientEvent:", v91);

    }
    v102 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("optInClientEvent"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v93 = -[OPTINSchemaOPTINClientEvent initWithDictionary:]([OPTINSchemaOPTINClientEvent alloc], "initWithDictionary:", v92);
      -[GRPSchemaSiriEventTypeUnion setOptInClientEvent:](v5, "setOptInClientEvent:", v93);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lrClientEvent"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v95 = -[LRSchemaLRClientEvent initWithDictionary:]([LRSchemaLRClientEvent alloc], "initWithDictionary:", v94);
      -[GRPSchemaSiriEventTypeUnion setLrClientEvent:](v5, "setLrClientEvent:", v95);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitClientEvent"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97 = -[HomeKitSchemaHKClientEvent initWithDictionary:]([HomeKitSchemaHKClientEvent alloc], "initWithDictionary:", v96);
      -[GRPSchemaSiriEventTypeUnion setHomeKitClientEvent:](v5, "setHomeKitClientEvent:", v97);

    }
    v98 = v5;

  }
  return v5;
}

- (void)setEventType:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GRPSchemaSiriEventTypeUnion setUeiClientEvent:](self, "setUeiClientEvent:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GRPSchemaSiriEventTypeUnion setPetUploadEvent:](self, "setPetUploadEvent:", v4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[GRPSchemaSiriEventTypeUnion setProvisionalEvent:](self, "setProvisionalEvent:", v4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[GRPSchemaSiriEventTypeUnion setTestExecutionEvent:](self, "setTestExecutionEvent:", v4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[GRPSchemaSiriEventTypeUnion setRequestLinkEvent:](self, "setRequestLinkEvent:", v4);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[GRPSchemaSiriEventTypeUnion setFlowClientEvent:](self, "setFlowClientEvent:", v4);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[GRPSchemaSiriEventTypeUnion setCamClientEvent:](self, "setCamClientEvent:", v4);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[GRPSchemaSiriEventTypeUnion setUspClientEvent:](self, "setUspClientEvent:", v4);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[GRPSchemaSiriEventTypeUnion setDimClientEvent:](self, "setDimClientEvent:", v4);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      -[GRPSchemaSiriEventTypeUnion setNlxClientEvent:](self, "setNlxClientEvent:", v4);
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        -[GRPSchemaSiriEventTypeUnion setOrchClientEvent:](self, "setOrchClientEvent:", v4);
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          -[GRPSchemaSiriEventTypeUnion setAsrClientEvent:](self, "setAsrClientEvent:", v4);
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            -[GRPSchemaSiriEventTypeUnion setIhClientEvent:](self, "setIhClientEvent:", v4);
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              -[GRPSchemaSiriEventTypeUnion setMhClientEvent:](self, "setMhClientEvent:", v4);
                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                -[GRPSchemaSiriEventTypeUnion setTtsClientEvent:](self, "setTtsClientEvent:", v4);
                              }
                              else
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  -[GRPSchemaSiriEventTypeUnion setClpClientEvent:](self, "setClpClientEvent:", v4);
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    -[GRPSchemaSiriEventTypeUnion setRrClientEvent:](self, "setRrClientEvent:", v4);
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      -[GRPSchemaSiriEventTypeUnion setCnvClientEvent:](self, "setCnvClientEvent:", v4);
                                    }
                                    else
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        -[GRPSchemaSiriEventTypeUnion setAncClientEvent:](self, "setAncClientEvent:", v4);
                                      }
                                      else
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          -[GRPSchemaSiriEventTypeUnion setHalClientEvent:](self, "setHalClientEvent:", v4);
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            -[GRPSchemaSiriEventTypeUnion setNetClientEvent:](self, "setNetClientEvent:", v4);
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              -[GRPSchemaSiriEventTypeUnion setSadClientEvent:](self, "setSadClientEvent:", v4);
                                            }
                                            else
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                -[GRPSchemaSiriEventTypeUnion setDodmlClientEvent:](self, "setDodmlClientEvent:", v4);
                                              }
                                              else
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  -[GRPSchemaSiriEventTypeUnion setPlusClientEvent:](self, "setPlusClientEvent:", v4);
                                                }
                                                else
                                                {
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    -[GRPSchemaSiriEventTypeUnion setExpSearchClientEvent:](self, "setExpSearchClientEvent:", v4);
                                                  }
                                                  else
                                                  {
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      -[GRPSchemaSiriEventTypeUnion setExpSiriClientEvent:](self, "setExpSiriClientEvent:", v4);
                                                    }
                                                    else
                                                    {
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        -[GRPSchemaSiriEventTypeUnion setSrstClientEvent:](self, "setSrstClientEvent:", v4);
                                                      }
                                                      else
                                                      {
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          -[GRPSchemaSiriEventTypeUnion setPommmesClientEvent:](self, "setPommmesClientEvent:", v4);
                                                        }
                                                        else
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            -[GRPSchemaSiriEventTypeUnion setCdaClientEvent:](self, "setCdaClientEvent:", v4);
                                                          }
                                                          else
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              -[GRPSchemaSiriEventTypeUnion setMwtClientEvent:](self, "setMwtClientEvent:", v4);
                                                            }
                                                            else
                                                            {
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                -[GRPSchemaSiriEventTypeUnion setHomeClientEvent:](self, "setHomeClientEvent:", v4);
                                                              }
                                                              else
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  -[GRPSchemaSiriEventTypeUnion setGradingOptInStateChange:](self, "setGradingOptInStateChange:", v4);
                                                                }
                                                                else
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    -[GRPSchemaSiriEventTypeUnion setOptinStatePropagationEvent:](self, "setOptinStatePropagationEvent:", v4);
                                                                  }
                                                                  else
                                                                  {
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      -[GRPSchemaSiriEventTypeUnion setRssClientEvent:](self, "setRssClientEvent:", v4);
                                                                    }
                                                                    else
                                                                    {
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        -[GRPSchemaSiriEventTypeUnion setSugClientEvent:](self, "setSugClientEvent:", v4);
                                                                      }
                                                                      else
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          -[GRPSchemaSiriEventTypeUnion setFlowLinkClientEvent:](self, "setFlowLinkClientEvent:", v4);
                                                                        }
                                                                        else
                                                                        {
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            -[GRPSchemaSiriEventTypeUnion setRfClientEvent:](self, "setRfClientEvent:", v4);
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              -[GRPSchemaSiriEventTypeUnion setSicClientEvent:](self, "setSicClientEvent:", v4);
                                                                            }
                                                                            else
                                                                            {
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                              {
                                                                                -[GRPSchemaSiriEventTypeUnion setInferenceClientEvent:](self, "setInferenceClientEvent:", v4);
                                                                              }
                                                                              else
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                {
                                                                                  -[GRPSchemaSiriEventTypeUnion setCaarClientEvent:](self, "setCaarClientEvent:", v4);
                                                                                }
                                                                                else
                                                                                {
                                                                                  objc_opt_class();
                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                  {
                                                                                    -[GRPSchemaSiriEventTypeUnion setRfgClientEvent:](self, "setRfgClientEvent:", v4);
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      -[GRPSchemaSiriEventTypeUnion setScClientEvent:](self, "setScClientEvent:", v4);
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      objc_opt_class();
                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                      {
                                                                                        -[GRPSchemaSiriEventTypeUnion setSiriSetupClientEvent:](self, "setSiriSetupClientEvent:", v4);
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          -[GRPSchemaSiriEventTypeUnion setOptInClientEvent:](self, "setOptInClientEvent:", v4);
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                          {
                                                                                            -[GRPSchemaSiriEventTypeUnion setLrClientEvent:](self, "setLrClientEvent:", v4);
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            objc_opt_class();
                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                              -[GRPSchemaSiriEventTypeUnion setHomeKitClientEvent:](self, "setHomeKitClientEvent:", v4);
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

}

- (id)getEventType
{
  unint64_t v2;

  v2 = self->_whichEvent_Type - 1;
  if (v2 > 0x2D)
    return 0;
  else
    return *(id *)((char *)&self->super.super.super.isa + *off_1E5639478[v2]);
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (BOOL)hasUeiClientEvent
{
  return self->_hasUeiClientEvent;
}

- (void)setHasUeiClientEvent:(BOOL)a3
{
  self->_hasUeiClientEvent = a3;
}

- (BOOL)hasPetUploadEvent
{
  return self->_hasPetUploadEvent;
}

- (void)setHasPetUploadEvent:(BOOL)a3
{
  self->_hasPetUploadEvent = a3;
}

- (BOOL)hasProvisionalEvent
{
  return self->_hasProvisionalEvent;
}

- (void)setHasProvisionalEvent:(BOOL)a3
{
  self->_hasProvisionalEvent = a3;
}

- (BOOL)hasTestExecutionEvent
{
  return self->_hasTestExecutionEvent;
}

- (void)setHasTestExecutionEvent:(BOOL)a3
{
  self->_hasTestExecutionEvent = a3;
}

- (BOOL)hasRequestLinkEvent
{
  return self->_hasRequestLinkEvent;
}

- (void)setHasRequestLinkEvent:(BOOL)a3
{
  self->_hasRequestLinkEvent = a3;
}

- (BOOL)hasFlowClientEvent
{
  return self->_hasFlowClientEvent;
}

- (void)setHasFlowClientEvent:(BOOL)a3
{
  self->_hasFlowClientEvent = a3;
}

- (BOOL)hasCamClientEvent
{
  return self->_hasCamClientEvent;
}

- (void)setHasCamClientEvent:(BOOL)a3
{
  self->_hasCamClientEvent = a3;
}

- (BOOL)hasUspClientEvent
{
  return self->_hasUspClientEvent;
}

- (void)setHasUspClientEvent:(BOOL)a3
{
  self->_hasUspClientEvent = a3;
}

- (BOOL)hasDimClientEvent
{
  return self->_hasDimClientEvent;
}

- (void)setHasDimClientEvent:(BOOL)a3
{
  self->_hasDimClientEvent = a3;
}

- (BOOL)hasNlxClientEvent
{
  return self->_hasNlxClientEvent;
}

- (void)setHasNlxClientEvent:(BOOL)a3
{
  self->_hasNlxClientEvent = a3;
}

- (BOOL)hasOrchClientEvent
{
  return self->_hasOrchClientEvent;
}

- (void)setHasOrchClientEvent:(BOOL)a3
{
  self->_hasOrchClientEvent = a3;
}

- (BOOL)hasAsrClientEvent
{
  return self->_hasAsrClientEvent;
}

- (void)setHasAsrClientEvent:(BOOL)a3
{
  self->_hasAsrClientEvent = a3;
}

- (BOOL)hasIhClientEvent
{
  return self->_hasIhClientEvent;
}

- (void)setHasIhClientEvent:(BOOL)a3
{
  self->_hasIhClientEvent = a3;
}

- (BOOL)hasMhClientEvent
{
  return self->_hasMhClientEvent;
}

- (void)setHasMhClientEvent:(BOOL)a3
{
  self->_hasMhClientEvent = a3;
}

- (BOOL)hasTtsClientEvent
{
  return self->_hasTtsClientEvent;
}

- (void)setHasTtsClientEvent:(BOOL)a3
{
  self->_hasTtsClientEvent = a3;
}

- (BOOL)hasClpClientEvent
{
  return self->_hasClpClientEvent;
}

- (void)setHasClpClientEvent:(BOOL)a3
{
  self->_hasClpClientEvent = a3;
}

- (BOOL)hasRrClientEvent
{
  return self->_hasRrClientEvent;
}

- (void)setHasRrClientEvent:(BOOL)a3
{
  self->_hasRrClientEvent = a3;
}

- (BOOL)hasCnvClientEvent
{
  return self->_hasCnvClientEvent;
}

- (void)setHasCnvClientEvent:(BOOL)a3
{
  self->_hasCnvClientEvent = a3;
}

- (BOOL)hasAncClientEvent
{
  return self->_hasAncClientEvent;
}

- (void)setHasAncClientEvent:(BOOL)a3
{
  self->_hasAncClientEvent = a3;
}

- (BOOL)hasHalClientEvent
{
  return self->_hasHalClientEvent;
}

- (void)setHasHalClientEvent:(BOOL)a3
{
  self->_hasHalClientEvent = a3;
}

- (BOOL)hasNetClientEvent
{
  return self->_hasNetClientEvent;
}

- (void)setHasNetClientEvent:(BOOL)a3
{
  self->_hasNetClientEvent = a3;
}

- (BOOL)hasSadClientEvent
{
  return self->_hasSadClientEvent;
}

- (void)setHasSadClientEvent:(BOOL)a3
{
  self->_hasSadClientEvent = a3;
}

- (BOOL)hasDodmlClientEvent
{
  return self->_hasDodmlClientEvent;
}

- (void)setHasDodmlClientEvent:(BOOL)a3
{
  self->_hasDodmlClientEvent = a3;
}

- (BOOL)hasPlusClientEvent
{
  return self->_hasPlusClientEvent;
}

- (void)setHasPlusClientEvent:(BOOL)a3
{
  self->_hasPlusClientEvent = a3;
}

- (BOOL)hasExpSearchClientEvent
{
  return self->_hasExpSearchClientEvent;
}

- (void)setHasExpSearchClientEvent:(BOOL)a3
{
  self->_hasExpSearchClientEvent = a3;
}

- (BOOL)hasExpSiriClientEvent
{
  return self->_hasExpSiriClientEvent;
}

- (void)setHasExpSiriClientEvent:(BOOL)a3
{
  self->_hasExpSiriClientEvent = a3;
}

- (BOOL)hasSrstClientEvent
{
  return self->_hasSrstClientEvent;
}

- (void)setHasSrstClientEvent:(BOOL)a3
{
  self->_hasSrstClientEvent = a3;
}

- (BOOL)hasPommmesClientEvent
{
  return self->_hasPommmesClientEvent;
}

- (void)setHasPommmesClientEvent:(BOOL)a3
{
  self->_hasPommmesClientEvent = a3;
}

- (BOOL)hasCdaClientEvent
{
  return self->_hasCdaClientEvent;
}

- (void)setHasCdaClientEvent:(BOOL)a3
{
  self->_hasCdaClientEvent = a3;
}

- (BOOL)hasMwtClientEvent
{
  return self->_hasMwtClientEvent;
}

- (void)setHasMwtClientEvent:(BOOL)a3
{
  self->_hasMwtClientEvent = a3;
}

- (BOOL)hasHomeClientEvent
{
  return self->_hasHomeClientEvent;
}

- (void)setHasHomeClientEvent:(BOOL)a3
{
  self->_hasHomeClientEvent = a3;
}

- (BOOL)hasGradingOptInStateChange
{
  return self->_hasGradingOptInStateChange;
}

- (void)setHasGradingOptInStateChange:(BOOL)a3
{
  self->_hasGradingOptInStateChange = a3;
}

- (BOOL)hasOptinStatePropagationEvent
{
  return self->_hasOptinStatePropagationEvent;
}

- (void)setHasOptinStatePropagationEvent:(BOOL)a3
{
  self->_hasOptinStatePropagationEvent = a3;
}

- (BOOL)hasRssClientEvent
{
  return self->_hasRssClientEvent;
}

- (void)setHasRssClientEvent:(BOOL)a3
{
  self->_hasRssClientEvent = a3;
}

- (BOOL)hasSugClientEvent
{
  return self->_hasSugClientEvent;
}

- (void)setHasSugClientEvent:(BOOL)a3
{
  self->_hasSugClientEvent = a3;
}

- (BOOL)hasFlowLinkClientEvent
{
  return self->_hasFlowLinkClientEvent;
}

- (void)setHasFlowLinkClientEvent:(BOOL)a3
{
  self->_hasFlowLinkClientEvent = a3;
}

- (BOOL)hasRfClientEvent
{
  return self->_hasRfClientEvent;
}

- (void)setHasRfClientEvent:(BOOL)a3
{
  self->_hasRfClientEvent = a3;
}

- (BOOL)hasSicClientEvent
{
  return self->_hasSicClientEvent;
}

- (void)setHasSicClientEvent:(BOOL)a3
{
  self->_hasSicClientEvent = a3;
}

- (BOOL)hasInferenceClientEvent
{
  return self->_hasInferenceClientEvent;
}

- (void)setHasInferenceClientEvent:(BOOL)a3
{
  self->_hasInferenceClientEvent = a3;
}

- (BOOL)hasCaarClientEvent
{
  return self->_hasCaarClientEvent;
}

- (void)setHasCaarClientEvent:(BOOL)a3
{
  self->_hasCaarClientEvent = a3;
}

- (BOOL)hasRfgClientEvent
{
  return self->_hasRfgClientEvent;
}

- (void)setHasRfgClientEvent:(BOOL)a3
{
  self->_hasRfgClientEvent = a3;
}

- (BOOL)hasScClientEvent
{
  return self->_hasScClientEvent;
}

- (void)setHasScClientEvent:(BOOL)a3
{
  self->_hasScClientEvent = a3;
}

- (BOOL)hasSiriSetupClientEvent
{
  return self->_hasSiriSetupClientEvent;
}

- (void)setHasSiriSetupClientEvent:(BOOL)a3
{
  self->_hasSiriSetupClientEvent = a3;
}

- (BOOL)hasOptInClientEvent
{
  return self->_hasOptInClientEvent;
}

- (void)setHasOptInClientEvent:(BOOL)a3
{
  self->_hasOptInClientEvent = a3;
}

- (BOOL)hasLrClientEvent
{
  return self->_hasLrClientEvent;
}

- (void)setHasLrClientEvent:(BOOL)a3
{
  self->_hasLrClientEvent = a3;
}

- (BOOL)hasHomeKitClientEvent
{
  return self->_hasHomeKitClientEvent;
}

- (void)setHasHomeKitClientEvent:(BOOL)a3
{
  self->_hasHomeKitClientEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitClientEvent, 0);
  objc_storeStrong((id *)&self->_lrClientEvent, 0);
  objc_storeStrong((id *)&self->_optInClientEvent, 0);
  objc_storeStrong((id *)&self->_siriSetupClientEvent, 0);
  objc_storeStrong((id *)&self->_scClientEvent, 0);
  objc_storeStrong((id *)&self->_rfgClientEvent, 0);
  objc_storeStrong((id *)&self->_caarClientEvent, 0);
  objc_storeStrong((id *)&self->_inferenceClientEvent, 0);
  objc_storeStrong((id *)&self->_sicClientEvent, 0);
  objc_storeStrong((id *)&self->_rfClientEvent, 0);
  objc_storeStrong((id *)&self->_flowLinkClientEvent, 0);
  objc_storeStrong((id *)&self->_sugClientEvent, 0);
  objc_storeStrong((id *)&self->_rssClientEvent, 0);
  objc_storeStrong((id *)&self->_optinStatePropagationEvent, 0);
  objc_storeStrong((id *)&self->_gradingOptInStateChange, 0);
  objc_storeStrong((id *)&self->_homeClientEvent, 0);
  objc_storeStrong((id *)&self->_mwtClientEvent, 0);
  objc_storeStrong((id *)&self->_cdaClientEvent, 0);
  objc_storeStrong((id *)&self->_pommmesClientEvent, 0);
  objc_storeStrong((id *)&self->_srstClientEvent, 0);
  objc_storeStrong((id *)&self->_expSiriClientEvent, 0);
  objc_storeStrong((id *)&self->_expSearchClientEvent, 0);
  objc_storeStrong((id *)&self->_plusClientEvent, 0);
  objc_storeStrong((id *)&self->_dodmlClientEvent, 0);
  objc_storeStrong((id *)&self->_sadClientEvent, 0);
  objc_storeStrong((id *)&self->_netClientEvent, 0);
  objc_storeStrong((id *)&self->_halClientEvent, 0);
  objc_storeStrong((id *)&self->_ancClientEvent, 0);
  objc_storeStrong((id *)&self->_cnvClientEvent, 0);
  objc_storeStrong((id *)&self->_rrClientEvent, 0);
  objc_storeStrong((id *)&self->_clpClientEvent, 0);
  objc_storeStrong((id *)&self->_ttsClientEvent, 0);
  objc_storeStrong((id *)&self->_mhClientEvent, 0);
  objc_storeStrong((id *)&self->_ihClientEvent, 0);
  objc_storeStrong((id *)&self->_asrClientEvent, 0);
  objc_storeStrong((id *)&self->_orchClientEvent, 0);
  objc_storeStrong((id *)&self->_nlxClientEvent, 0);
  objc_storeStrong((id *)&self->_dimClientEvent, 0);
  objc_storeStrong((id *)&self->_uspClientEvent, 0);
  objc_storeStrong((id *)&self->_camClientEvent, 0);
  objc_storeStrong((id *)&self->_flowClientEvent, 0);
  objc_storeStrong((id *)&self->_requestLinkEvent, 0);
  objc_storeStrong((id *)&self->_testExecutionEvent, 0);
  objc_storeStrong((id *)&self->_provisionalEvent, 0);
  objc_storeStrong((id *)&self->_petUploadEvent, 0);
  objc_storeStrong((id *)&self->_ueiClientEvent, 0);
}

+ (Class)getEventTypeClassForTag:(int)a3
{
  if ((a3 - 1) > 0x2D)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)getTagForEventTypeClass:(Class)a3
{
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C5F78;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C5F90;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C5FA8;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C5FC0;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C5FD8;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C5FF0;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6008;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6020;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6038;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6050;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6068;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6080;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6098;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C60B0;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C60C8;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C60E0;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C60F8;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6110;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6128;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6140;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6158;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6170;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6188;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C61A0;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C61B8;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C61D0;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C61E8;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6200;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6218;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6230;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6248;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6260;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6278;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6290;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C62A8;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C62C0;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C62D8;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C62F0;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6308;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6320;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6338;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6350;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6368;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6380;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0)
    return &unk_1E57C6398;
  if (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()))
    return &unk_1E57C63B0;
  return 0;
}

@end
