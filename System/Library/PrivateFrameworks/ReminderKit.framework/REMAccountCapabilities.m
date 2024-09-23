@implementation REMAccountCapabilities

- (BOOL)supportsPinnedLists
{
  return self->_supportsPinnedLists;
}

- (BOOL)supportsListAppearance
{
  return self->_supportsListAppearance;
}

- (REMAccountCapabilities)initWithAccountType:(int64_t)a3
{
  REMAccountCapabilities *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMAccountCapabilities;
  result = -[REMAccountCapabilities init](&v5, sel_init);
  if (result)
  {
    switch(a3)
    {
      case 1:
        result->_defaultReminderPriorityLevel = 0;
        *(_WORD *)&result->_supportsReminderActions = 1;
        *(_OWORD *)&result->_supportsSubtasks = xmmword_1B4B744D0;
        *(_DWORD *)&result->_supportsMultipleDateAlarmsOnRecurrence = 0;
        goto LABEL_9;
      case 2:
      case 6:
        *(_WORD *)&result->_supportsSubtasks = 257;
        result->_supportsListAppearance = 1;
        *(_DWORD *)&result->_supportsGroups = 16843009;
        result->_defaultReminderPriorityLevel = 0;
        *(_WORD *)&result->_supportsHashtags = 1;
        *(_OWORD *)&result->_supportsHourlyRecurrence = xmmword_1B4B744B0;
        *(_DWORD *)&result->_supportsCustomSmartLists = 16843009;
        *(_WORD *)&result->_supportsGroceriesList = 257;
        if (a3 == 6)
        {
          result->_supportsTemplates = 0;
          result->_supportsPinnedLists = 0;
        }
        return result;
      case 3:
        result->_defaultReminderPriorityLevel = 0;
        result->_insertsCompletedRecurrentCloneAtTail = 1;
        *(_OWORD *)&result->_supportsSubtasks = xmmword_1B4B744A0;
        *(_QWORD *)&result->_supportsMultipleDateAlarmsOnRecurrence = 0x101000001;
        *(_DWORD *)&result->_supportsCustomSmartLists = 0;
        *(_WORD *)&result->_supportsGroceriesList = 0;
        return result;
      case 4:
        *(_WORD *)&result->_supportsSubtasks = 0;
        result->_supportsListAppearance = 0;
        *(_DWORD *)&result->_supportsGroups = 0;
        result->_supportsCRDTs = 0;
        result->_defaultReminderPriorityLevel = 2;
        *(_WORD *)&result->_supportsHandoff = 0;
        *(_QWORD *)&result->_supportsHourlyRecurrence = 0x1010000010000;
        *(_DWORD *)&result->_supportsMoveAcrossSharedLists = 256;
        goto LABEL_9;
      case 5:
        result->_defaultReminderPriorityLevel = 0;
        *(_WORD *)&result->_supportsReminderActions = 1;
        *(_OWORD *)&result->_supportsSubtasks = xmmword_1B4B744C0;
        *(_DWORD *)&result->_supportsMultipleDateAlarmsOnRecurrence = 1;
LABEL_9:
        *(_QWORD *)&result->_supportsAssignments = 0;
        result->_supportsRecentlyDeletedList = 0;
        break;
      default:
        return result;
    }
  }
  return result;
}

- (BOOL)supportsSubtasks
{
  return self->_supportsSubtasks;
}

- (BOOL)supportsSections
{
  return self->_supportsSections;
}

- (BOOL)supportsListSharees
{
  return self->_supportsListSharees;
}

- (BOOL)supportsCustomSmartLists
{
  return self->_supportsCustomSmartLists;
}

- (BOOL)supportsTemplates
{
  return self->_supportsTemplates;
}

- (BOOL)supportsGroups
{
  return self->_supportsGroups;
}

- (BOOL)supportsFlagged
{
  return self->_supportsFlagged;
}

- (BOOL)supportsAssignments
{
  return self->_supportsAssignments;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _BOOL4 v38;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_33;
  v5 = -[REMAccountCapabilities supportsSubtasks](self, "supportsSubtasks");
  if (v5 != objc_msgSend(v4, "supportsSubtasks"))
    goto LABEL_33;
  v6 = -[REMAccountCapabilities supportsAttachments](self, "supportsAttachments");
  if (v6 != objc_msgSend(v4, "supportsAttachments"))
    goto LABEL_33;
  v7 = -[REMAccountCapabilities supportsListAppearance](self, "supportsListAppearance");
  if (v7 != objc_msgSend(v4, "supportsListAppearance"))
    goto LABEL_33;
  v8 = -[REMAccountCapabilities supportsCloudKitSync](self, "supportsCloudKitSync");
  if (v8 != objc_msgSend(v4, "supportsCloudKitSync"))
    goto LABEL_33;
  v9 = -[REMAccountCapabilities supportsEventKitSync](self, "supportsEventKitSync");
  if (v9 != objc_msgSend(v4, "supportsEventKitSync"))
    goto LABEL_33;
  v10 = -[REMAccountCapabilities supportsGroups](self, "supportsGroups");
  if (v10 != objc_msgSend(v4, "supportsGroups"))
    goto LABEL_33;
  v11 = -[REMAccountCapabilities supportsFlagged](self, "supportsFlagged");
  if (v11 != objc_msgSend(v4, "supportsFlagged"))
    goto LABEL_33;
  v12 = -[REMAccountCapabilities supportsLocation](self, "supportsLocation");
  if (v12 != objc_msgSend(v4, "supportsLocation"))
    goto LABEL_33;
  v13 = -[REMAccountCapabilities supportsPersonTrigger](self, "supportsPersonTrigger");
  if (v13 != objc_msgSend(v4, "supportsPersonTrigger"))
    goto LABEL_33;
  v14 = -[REMAccountCapabilities supportsCalDAVNotifications](self, "supportsCalDAVNotifications");
  if (v14 != objc_msgSend(v4, "supportsCalDAVNotifications"))
    goto LABEL_33;
  v15 = -[REMAccountCapabilities supportsListSharees](self, "supportsListSharees");
  if (v15 != objc_msgSend(v4, "supportsListSharees"))
    goto LABEL_33;
  v16 = -[REMAccountCapabilities supportsListShareesMutation](self, "supportsListShareesMutation");
  if (v16 != objc_msgSend(v4, "supportsListShareesMutation"))
    goto LABEL_33;
  v17 = -[REMAccountCapabilities supportsMoveAcrossLists](self, "supportsMoveAcrossLists");
  if (v17 != objc_msgSend(v4, "supportsMoveAcrossLists"))
    goto LABEL_33;
  v18 = -[REMAccountCapabilities supportsMoveAcrossSharedLists](self, "supportsMoveAcrossSharedLists");
  if (v18 != objc_msgSend(v4, "supportsMoveAcrossSharedLists"))
    goto LABEL_33;
  v19 = -[REMAccountCapabilities supportsCRDTs](self, "supportsCRDTs");
  if (v19 != objc_msgSend(v4, "supportsCRDTs"))
    goto LABEL_33;
  v20 = -[REMAccountCapabilities defaultReminderPriorityLevel](self, "defaultReminderPriorityLevel");
  if (v20 != objc_msgSend(v4, "defaultReminderPriorityLevel"))
    goto LABEL_33;
  v21 = -[REMAccountCapabilities supportsHandoff](self, "supportsHandoff");
  if (v21 != objc_msgSend(v4, "supportsHandoff"))
    goto LABEL_33;
  v22 = -[REMAccountCapabilities supportsReminderActions](self, "supportsReminderActions");
  if (v22 != objc_msgSend(v4, "supportsReminderActions"))
    goto LABEL_33;
  v23 = -[REMAccountCapabilities supportsHourlyRecurrence](self, "supportsHourlyRecurrence");
  if (v23 != objc_msgSend(v4, "supportsHourlyRecurrence"))
    goto LABEL_33;
  v24 = -[REMAccountCapabilities supportsMultipleDateAlarmsOnRecurrence](self, "supportsMultipleDateAlarmsOnRecurrence");
  if (v24 != objc_msgSend(v4, "supportsMultipleDateAlarmsOnRecurrence"))
    goto LABEL_33;
  v25 = -[REMAccountCapabilities supportsAssignments](self, "supportsAssignments");
  if (v25 != objc_msgSend(v4, "supportsAssignments"))
    goto LABEL_33;
  v26 = -[REMAccountCapabilities supportsHashtags](self, "supportsHashtags");
  if (v26 != objc_msgSend(v4, "supportsHashtags"))
    goto LABEL_33;
  v27 = -[REMAccountCapabilities insertsCompletedRecurrentCloneAtTail](self, "insertsCompletedRecurrentCloneAtTail");
  if (v27 != objc_msgSend(v4, "insertsCompletedRecurrentCloneAtTail"))
    goto LABEL_33;
  v28 = -[REMAccountCapabilities supportsCustomSmartLists](self, "supportsCustomSmartLists");
  if (v28 != objc_msgSend(v4, "supportsCustomSmartLists"))
    goto LABEL_33;
  v29 = -[REMAccountCapabilities supportsGroceriesList](self, "supportsGroceriesList");
  if (v29 == objc_msgSend(v4, "supportsGroceriesList")
    && (v30 = -[REMAccountCapabilities supportsTemplates](self, "supportsTemplates"),
        v30 == objc_msgSend(v4, "supportsTemplates"))
    && (v31 = -[REMAccountCapabilities supportsPinnedLists](self, "supportsPinnedLists"),
        v31 == objc_msgSend(v4, "supportsPinnedLists"))
    && (v32 = -[REMAccountCapabilities supportsTextStyling](self, "supportsTextStyling"),
        v32 == objc_msgSend(v4, "supportsTextStyling"))
    && (v33 = -[REMAccountCapabilities supportsDeletionByTTL](self, "supportsDeletionByTTL"),
        v33 == objc_msgSend(v4, "supportsDeletionByTTL"))
    && (v34 = -[REMAccountCapabilities supportsSections](self, "supportsSections"),
        v34 == objc_msgSend(v4, "supportsSections"))
    && (v35 = -[REMAccountCapabilities supportsDueDateDeltaAlerts](self, "supportsDueDateDeltaAlerts"),
        v35 == objc_msgSend(v4, "supportsDueDateDeltaAlerts")))
  {
    v38 = -[REMAccountCapabilities supportsRecentlyDeletedList](self, "supportsRecentlyDeletedList");
    v36 = v38 ^ objc_msgSend(v4, "supportsRecentlyDeletedList") ^ 1;
  }
  else
  {
LABEL_33:
    LOBYTE(v36) = 0;
  }

  return v36;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (-[REMAccountCapabilities supportsSubtasks](self, "supportsSubtasks"))
    v3 = 2;
  else
    v3 = 0;
  v4 = v3 | -[REMAccountCapabilities supportsAttachments](self, "supportsAttachments");
  if (-[REMAccountCapabilities supportsListAppearance](self, "supportsListAppearance"))
    v5 = 2;
  else
    v5 = 0;
  v6 = v5 | (4 * v4) | -[REMAccountCapabilities supportsCloudKitSync](self, "supportsCloudKitSync");
  if (-[REMAccountCapabilities supportsEventKitSync](self, "supportsEventKitSync"))
    v7 = 2;
  else
    v7 = 0;
  v8 = v7 | (4 * v6) | -[REMAccountCapabilities supportsGroups](self, "supportsGroups");
  if (-[REMAccountCapabilities supportsFlagged](self, "supportsFlagged"))
    v9 = 2;
  else
    v9 = 0;
  v10 = v9 | (4 * v8) | -[REMAccountCapabilities supportsLocation](self, "supportsLocation");
  if (-[REMAccountCapabilities supportsPersonTrigger](self, "supportsPersonTrigger"))
    v11 = 2;
  else
    v11 = 0;
  v12 = v11 | (4 * v10) | -[REMAccountCapabilities supportsCalDAVNotifications](self, "supportsCalDAVNotifications");
  if (-[REMAccountCapabilities supportsListSharees](self, "supportsListSharees"))
    v13 = 2;
  else
    v13 = 0;
  v14 = v13 | (4 * v12) | -[REMAccountCapabilities supportsListShareesMutation](self, "supportsListShareesMutation");
  if (-[REMAccountCapabilities supportsMoveAcrossLists](self, "supportsMoveAcrossLists"))
    v15 = 2;
  else
    v15 = 0;
  v16 = v15 | (4 * v14) | -[REMAccountCapabilities supportsMoveAcrossSharedLists](self, "supportsMoveAcrossSharedLists");
  if (-[REMAccountCapabilities supportsCRDTs](self, "supportsCRDTs"))
    v17 = 2;
  else
    v17 = 0;
  v18 = v17 | (4 * v16) | (-[REMAccountCapabilities defaultReminderPriorityLevel](self, "defaultReminderPriorityLevel") != 0);
  if (-[REMAccountCapabilities supportsHandoff](self, "supportsHandoff"))
    v19 = 2;
  else
    v19 = 0;
  v20 = v19 | (4 * v18) | -[REMAccountCapabilities supportsReminderActions](self, "supportsReminderActions");
  if (-[REMAccountCapabilities supportsHourlyRecurrence](self, "supportsHourlyRecurrence"))
    v21 = 2;
  else
    v21 = 0;
  v22 = v21 | (4 * v20) | -[REMAccountCapabilities supportsMultipleDateAlarmsOnRecurrence](self, "supportsMultipleDateAlarmsOnRecurrence");
  if (-[REMAccountCapabilities supportsAssignments](self, "supportsAssignments"))
    v23 = 2;
  else
    v23 = 0;
  v24 = v23 | (4 * v22) | -[REMAccountCapabilities supportsHashtags](self, "supportsHashtags");
  if (-[REMAccountCapabilities insertsCompletedRecurrentCloneAtTail](self, "insertsCompletedRecurrentCloneAtTail"))
    v25 = 2;
  else
    v25 = 0;
  v26 = v25 | (4 * v24) | -[REMAccountCapabilities supportsCustomSmartLists](self, "supportsCustomSmartLists");
  if (-[REMAccountCapabilities supportsGroceriesList](self, "supportsGroceriesList"))
    v27 = 2;
  else
    v27 = 0;
  v28 = v27 | (4 * v26) | -[REMAccountCapabilities supportsTemplates](self, "supportsTemplates");
  if (-[REMAccountCapabilities supportsPinnedLists](self, "supportsPinnedLists"))
    v29 = 2;
  else
    v29 = 0;
  v30 = v29 | (4 * v28) | -[REMAccountCapabilities supportsTextStyling](self, "supportsTextStyling");
  if (-[REMAccountCapabilities supportsDeletionByTTL](self, "supportsDeletionByTTL"))
    v31 = 2;
  else
    v31 = 0;
  v32 = v31 | (4 * v30) | -[REMAccountCapabilities supportsSections](self, "supportsSections");
  if (-[REMAccountCapabilities supportsDueDateDeltaAlerts](self, "supportsDueDateDeltaAlerts"))
    v33 = 2;
  else
    v33 = 0;
  return v33 | (4 * v32) | -[REMAccountCapabilities supportsRecentlyDeletedList](self, "supportsRecentlyDeletedList");
}

- (BOOL)supportsAttachments
{
  return self->_supportsAttachments;
}

- (BOOL)supportsPersonTrigger
{
  return self->_supportsPersonTrigger;
}

- (BOOL)supportsLocation
{
  return self->_supportsLocation;
}

- (BOOL)supportsHourlyRecurrence
{
  return self->_supportsHourlyRecurrence;
}

- (BOOL)supportsEventKitSync
{
  return self->_supportsEventKitSync;
}

- (BOOL)supportsCloudKitSync
{
  return self->_supportsCloudKitSync;
}

- (BOOL)supportsCalDAVNotifications
{
  return self->_supportsCalDAVNotifications;
}

- (BOOL)supportsListShareesMutation
{
  return self->_supportsListShareesMutation;
}

- (BOOL)supportsMoveAcrossLists
{
  return self->_supportsMoveAcrossLists;
}

- (BOOL)supportsMoveAcrossSharedLists
{
  return self->_supportsMoveAcrossSharedLists;
}

- (BOOL)supportsMultipleDateAlarmsOnRecurrence
{
  return self->_supportsMultipleDateAlarmsOnRecurrence;
}

- (BOOL)supportsDueDateDeltaAlerts
{
  return self->_supportsDueDateDeltaAlerts;
}

- (int64_t)defaultReminderPriorityLevel
{
  return self->_defaultReminderPriorityLevel;
}

- (BOOL)supportsHandoff
{
  return self->_supportsHandoff;
}

- (BOOL)supportsReminderActions
{
  return self->_supportsReminderActions;
}

- (BOOL)supportsCRDTs
{
  return self->_supportsCRDTs;
}

- (BOOL)supportsHashtags
{
  return self->_supportsHashtags;
}

- (BOOL)insertsCompletedRecurrentCloneAtTail
{
  return self->_insertsCompletedRecurrentCloneAtTail;
}

- (BOOL)supportsTextStyling
{
  return self->_supportsTextStyling;
}

- (BOOL)supportsDeletionByTTL
{
  return self->_supportsDeletionByTTL;
}

- (BOOL)supportsGroceriesList
{
  return self->_supportsGroceriesList;
}

- (BOOL)supportsRecentlyDeletedList
{
  return self->_supportsRecentlyDeletedList;
}

@end
