#region ProofPoint Essentials IP Ranges AMER 
$ProofPointIPRanges = New-Object -TypeName 'System.Collections.Generic.List[string]'
$ProofPointIPRanges.Add('148.163.159.0/24')
$ProofPointIPRanges.Add('148.163.158.0/24')
$ProofPointIPRanges.Add('148.163.157.0/24')
$ProofPointIPRanges.Add('148.163.156.0/24')
$ProofPointIPRanges.Add('148.163.155.0/24')
$ProofPointIPRanges.Add('148.163.154.0/24')
$ProofPointIPRanges.Add('148.163.153.0/24')
$ProofPointIPRanges.Add('148.163.152.0/24')
$ProofPointIPRanges.Add('148.163.151.0/24')
$ProofPointIPRanges.Add('148.163.150.0/24')
$ProofPointIPRanges.Add('148.163.149.0/24')
$ProofPointIPRanges.Add('148.163.148.0/24')
$ProofPointIPRanges.Add('148.163.147.0/24')
$ProofPointIPRanges.Add('148.163.146.0/24')
$ProofPointIPRanges.Add('148.163.145.0/24')
$ProofPointIPRanges.Add('148.163.144.0/24')
$ProofPointIPRanges.Add('148.163.143.0/24')
$ProofPointIPRanges.Add('148.163.142.0/24')
$ProofPointIPRanges.Add('148.163.141.0/24')
$ProofPointIPRanges.Add('148.163.140.0/24')
$ProofPointIPRanges.Add('148.163.139.0/24')
$ProofPointIPRanges.Add('148.163.138.0/24')
$ProofPointIPRanges.Add('148.163.137.0/24')
$ProofPointIPRanges.Add('148.163.136.0/24')
$ProofPointIPRanges.Add('148.163.135.0/24')
$ProofPointIPRanges.Add('148.163.133.0/24')
$ProofPointIPRanges.Add('148.163.132.0/24')
$ProofPointIPRanges.Add('148.163.131.0/24')
$ProofPointIPRanges.Add('148.163.130.0/24')
$ProofPointIPRanges.Add('148.163.129.0/24')
$ProofPointIPRanges.Add('148.163.128.0/24')
$ProofPointIPRanges.Add('67.231.148.0/24')
$ProofPointIPRanges.Add('67.231.147.0/24')
$ProofPointIPRanges.Add('67.231.146.0/24')
$ProofPointIPRanges.Add('67.231.145.0/24')
$ProofPointIPRanges.Add('67.231.144.0/24')
$ProofPointIPRanges.Add('67.231.156.0/24')
$ProofPointIPRanges.Add('67.231.155.0/24')
$ProofPointIPRanges.Add('67.231.154.0/24')
$ProofPointIPRanges.Add('67.231.153.0/24')
$ProofPointIPRanges.Add('67.231.152.0/24')
#endregion

#region Develop Transport rule to by-pass Spam Filtering for ProofPoint Essentials
$TransportRule                = New-Object -TypeName System.Collections.Hashtable
$TransportRule.Name           = 'By-pass Spam filtering for Proofpoint Essentials'
$TransportRule.SetSCL         = '-1'
$TransportRule.Enabled        = $true
$TransportRule.Comments       = 'DO NOT DELETE OR MODIFY THIS RULE!'
$TransportRule.SenderIPRanges = $ProofPointIPRanges
#endregion

#region Develop Outbound Connector for Proofpoint Essentials Inbound Connector
$InboundConnector                   = New-Object -TypeName System.Collections.Hashtable
$InboundConnector.Name              = 'Proofpoint Essentials Inbound Connector'
$InboundConnector.Comment           = 'Inbound connector for Proofpoint Essentials'
$InboundConnector.Enabled           = $false
$InboundConnector.RequireTLS        = $true
$InboundConnector.SenderDomains     = '*'
$InboundConnector.SenderIPAddresses = $ProofPointIPRanges
#endregion

#region Develop Outbound Connector for Proofpoint Essentials Inbound Connector
$OutboundConnector                   = New-Object -TypeName System.Collections.Hashtable
$OutboundConnector.Name              = 'Proofpoint Essentials Outbound Connector'
$OutboundConnector.Comment           = 'Outbound connector for Proofpoint Essentials'
$OutboundConnector.Enabled           = $false
$OutboundConnector.SmartHosts        = 'outbound-us1.ppe-hosted.com'
$OutboundConnector.TLSSettings       = 'EncryptionOnly'
$OutboundConnector.UseMXRecord       = $false
$OutboundConnector.ConnectorType     = 'Partner'
$OutboundConnector.RecipientDomains  = '*'
#endregion


New-TransportRule     @TransportRule
New-InboundConnector  @InboundConnector
New-OutboundConnector @OutboundConnector
