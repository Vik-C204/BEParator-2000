const { network, ethers } = require("hardhat")
const { developmentChains, networkConfig } = require("../helper-hardhat-config")
const { verify } = require("../utils/verify")

module.exports = async function ({ getNamedAccounts, deployments }) {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()

    /*const NoOwnerFixedNoMintCanBurnNoPause = await deploy("NoOwnerFixedNoMintCanBurnNoPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedFixedNoMintCanBurnNoPause = await deploy("OwnedFixedNoMintCanBurnNoPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedFixedNoMintNoBurnCanPause = await deploy("OwnedFixedNoMintNoBurnCanPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedFixedNoMintCanBurnCanPause = await deploy("OwnedFixedNoMintCanBurnCanPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedFixedNoMintNoBurnNoPause = await deploy("OwnedFixedNoMintNoBurnNoPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedUnlimitCanMintCanBurnCanPause = await deploy("OwnedUnlimitCanMintCanBurnCanPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    }

    const OwnedUnlimitCanMintNoBurnCanPause = await deploy("OwnedUnlimitCanMintNoBurnCanPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedUnlimitCanMintNoBurnNoPause = await deploy("OwnedUnlimitCanMintNoBurnNoPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })*/

    const OwnedUnlimitCanMintCanBurnNoPause = await deploy("OwnedUnlimitCanMintCanBurnNoPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    /*const OwnedCappedCanMintCanBurnCanPause = await deploy("OwnedCappedCanMintCanBurnCanPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedCappedCanMintNoBurnCanPause = await deploy("OwnedCappedCanMintNoBurnCanPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedCappedCanMintCanBurnNoPause = await deploy("OwnedCappedCanMintCanBurnNoPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const OwnedCappedCanMintNoBurnNoPause = await deploy("OwnedCappedCanMintNoBurnNoPause", {
        from: deployer,
        args: ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    const RoleGenerator = await deploy("RoleGenerator", {
        from: deployer,
        args: [], 
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })*/



    

    if (!developmentChains.includes(network.name) && process.env.BSCSCAN_API_KEY) {
        log("Verifying...")
        //await verify(NoOwnerFixedNoMintCanBurnNoPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])
        //await verify(OwnedFixedNoMintCanBurnNoPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])
        //await verify(OwnedFixedNoMintNoBurnCanPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])
        //await verify(OwnedFixedNoMintCanBurnCanPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])
        //await verify(OwnedFixedNoMintNoBurnNoPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])
        

        //await verify(OwnedUnlimitCanMintCanBurnCanPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])
        //await verify(OwnedUnlimitCanMintNoBurnCanPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])
        //await verify(OwnedUnlimitCanMintNoBurnNoPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])
        await verify(OwnedUnlimitCanMintCanBurnNoPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18])

        /*await verify(OwnedCappedCanMintCanBurnCanPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18,1000])
        await verify(OwnedCappedCanMintNoBurnCanPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18,1000])
        await verify(OwnedCappedCanMintCanBurnNoPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18,1000])
        await verify(OwnedCappedCanMintNoBurnNoPause.address, ["verifyName","verifySymbol",100,"0x9EE8bF521f095Fc31208eB0Ec246ae8E705C1Abc",18,1000])
        //await verify(RoleGenerator.address, [])*/
    }
}

module.exports.tags = ["all", "generator"]