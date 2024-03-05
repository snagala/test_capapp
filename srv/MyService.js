const cds = require("@sap/cds");
const {employees} = cds.entities("anubhav.db.master");
module.exports = (cds) => {
    const {ReadEmployeeSrv} = cds.entities;
    cds.on('hello', (req, res) =>{
        return 'Welcome' +req.data.name +' to my world of CAPM Services';

    })
    cds.on('READ', ReadEmployeeSrv, async(req,res) =>{
        var oRecord ={
            "ID": "Dummydata",
            "nameFirst": "Saddikuti",
            "nameMiddle": "Naga",
            "nameLast": "Lakshmi",
            "nameInitials": null,
            "sex": "F",
            "language": "E",
            "phoneNumber": "+1 224 374 524",
            "email": "sally.spring@itelo.info",
            "loginName": "SPRINGS",
            "Currency_code": "USD",
            "salaryAmount": 55549,
            "accountNumber": "111222333",
            "bankId": "510000655",
            "bankName": "My Bank of Antioch"
        }
        var aemp=[];
        const tx = cds.tx(req);
        aemp = await tx.run(SELECT.from(employees).where(
            'salaryAmount >= 80000'
        ));
        aemp.push(oRecord);
        return aemp;


        
    });



}